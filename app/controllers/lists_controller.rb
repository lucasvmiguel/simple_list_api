class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy]

  def index
    lists = List.all
    render json: lists, status: :ok
  end

  def create
    list = List.new(list_params)
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
      @list = List.find(params[:id])
    end
end
