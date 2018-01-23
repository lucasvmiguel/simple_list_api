class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def index
    items = Item.all
    render json: items, status: :ok
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: :created
    else
      puts item.errors.inspect
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
      @item = Item.find(params[:id])
    end
end
