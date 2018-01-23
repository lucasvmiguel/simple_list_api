class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :set_item, only: [:update, :destroy]

  def index
    items = @list.items
    render json: items, status: :ok
  end

  def create
    item = Item.new(item_params)
    item.list = @list
    if item.save
      render json: item, status: :created
    else
      render json: item, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render status: :no_content
  end

  private

    def item_params
      params.require(:item).permit(:title, :checked)
    end

    def set_item
      @item = @list.items.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end
end
