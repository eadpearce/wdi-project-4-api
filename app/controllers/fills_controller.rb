class FillsController < ApplicationController
  before_action :set_fill, only: [:show, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :index_by_tag, :index_by_prompt, :index_by_user]

  # GET /fills
  def index
    @fills = Fill.all

    render json: @fills
  end

  # get all fills for a certain user
  def index_by_user
    # find the user by username
    user = User.find_by(username: params[:user_id])
    # find the fills by user.id
    @fills = Fill.where(user_id: user.id)
    render json: @fills, include: ['user', 'prompt', 'comments.user', 'comments.user.id', 'comments.user.username']
  end

  # get all fills for a certain prompt
  def index_by_prompt
    # find the prompt by params
    prompt = Prompt.find_by(id: params[:prompt_id])
    # find all fills for this prompt
    @fills = Fill.where(prompt_id: prompt.id)
    render json: @fills, include: ['user', 'prompt', 'comments.user', 'comments.user.id', 'comments.user.username']
  end

  def index_by_tag
    tag = Tag.find_by(id: params[:tag_id])
    @fills = tag.fills
    render json: @fills, include: ['fills', 'user', 'comments.user', 'comments.user.id', 'comments.user.username']
  end

  # GET /fills/1
  def show
    render json: @fill, include: ['user', 'prompt', 'comments.user', 'comments.user.id', 'comments.user.username']
  end

  # POST /fills
  def create
    @fill = Fill.new(fill_params)
    # assign the current logged in user as the fill's author
    @fill.user_id = @current_user.id
    prompt = Prompt.find_by(id: @fill.prompt_id)
    @fill.prompt = prompt
    puts "FILL: #{@fill.prompt_id}"
    fill_tags = @fill.tagged_as.strip.split(',')
    for tag in fill_tags
      tag.strip!
    end

    if @fill.save
      for tag in fill_tags
        # change to lowercase to avoid duplicates with odd cases
        tag.downcase!
        # avoid creating duplicates with the same name
        new_tag = Tag.find_or_create_by(name: tag)
        @fill.tags << new_tag
      end
      render json: @fill, status: :created, location: @fill
    else
      render json: @fill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fills/1
  def update
    if @fill.update(fill_params)
      render json: @fill
    else
      render json: @fill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fills/1
  def destroy
    @fill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fill
      @fill = Fill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fill_params
      params.require(:fill).permit(:prompt_id, :body, :title, :tagged_as)
    end
end
