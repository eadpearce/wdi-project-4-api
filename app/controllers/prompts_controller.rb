class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :update, :destroy]

  # GET /prompts
  def index
    @prompts = Prompt.all

    render json: @prompts
  end

  # get all fills for a certain user
  def prompts_for_user
    # find the user by username
    user = User.find_by(username: params[:user_id])
    # find the prompts by user.id
    @prompts = Prompt.where(user_id: user.id)
    render json: @prompts
  end

  # GET /prompts/1
  def show
    render json: @prompt
  end

  # POST /prompts
  def create
    @prompt = Prompt.new(prompt_params)
    # assign the current logged in user as the prompt's author
    @prompt.user_id = @current_user.id
    # separate the prompt's tags by commas
    prompt_tags = @prompt.tagged_as.strip.split(',')
    for tag in prompt_tags
      tag.strip!
    end
    puts "PROMPT TAGS: #{prompt_tags}"

    if @prompt.save
      for tag in prompt_tags
        # change to lowercase to avoid duplicates with odd cases
        tag.downcase!
        # avoid creating duplicates with the same name
        new_tag = Tag.find_or_create_by(name: tag)
        @prompt.tags << new_tag
      end
      render json: @prompt, status: :created, location: @prompt
    else
      render json: @prompt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prompts/1
  def update
    if @prompt.update(prompt_params)
      render json: @prompt
    else
      render json: @prompt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prompts/1
  def destroy
    @prompt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prompt_params
      params.require(:prompt).permit(:title, :body, :tagged_as)
    end
end
