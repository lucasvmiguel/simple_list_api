class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy]

  def index
    lists = current_user.lists
    render json: lists, status: :ok
  end

  def create
    list = List.new(list_params)
    list.user = current_user
    if list.save
      render json: list, status: :created
    else
      render json: list, status: :unprocessable_entity
    end
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
    end
end
