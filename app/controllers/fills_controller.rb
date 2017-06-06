class FillsController < ApplicationController
  before_action :set_fill, only: [:show, :update, :destroy]

  # GET /fills
  def index
    @fills = Fill.all

    render json: @fills
  end

  # get all fills for a certain user
  def fills_for_user
    # find the user by username
    user = User.find_by(username: params[:user_id])
    # find the fills by user.id
    @fills = Fill.where(user_id: user.id)
    render json: @fills, include: ['user', 'prompt', 'comments.user', 'comments.user.id', 'comments.user.username']
  end

  # get all fills for a certain prompt
  def fills_for_prompt
    # find the prompt by params
    prompt = Prompt.find_by(id: params[:prompt_id])
    # find all fills for this prompt
    @fills = Fill.where(prompt_id: prompt.id)
    render json: @fills, include: ['user', 'prompt', 'comments.user', 'comments.user.id', 'comments.user.username']
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

    if @fill.save
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
      params.require(:fill).permit(:prompt_id, :user_id, :body, :title)
    end
end
