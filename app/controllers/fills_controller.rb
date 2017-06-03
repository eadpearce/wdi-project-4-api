class FillsController < ApplicationController
  before_action :set_fill, only: [:show, :update, :destroy]

  # GET /fills
  def index
    @fills = Fill.all

    render json: @fills
  end

  # GET /fills/1
  def show
    render json: @fill
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
      params.require(:fill).permit(:prompt_id, :user_id, :body)
    end
end
