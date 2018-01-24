class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy]

  def index
    lists = current_user.lists

    render json: { status: 'success', data: lists }, status: :ok
  end

  def create
    list = List.new(list_params)
    list.user = current_user
    success = list.save

    render_or_unprocessable_entity(success, list, :created)
  end

  def destroy
    @list.destroy
    render status: :no_content
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @list = current_user.lists.find(params[:id])
      render status: :not_found if @list.nil?
    end
end
