class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :set_item, only: [:update, :destroy]

  def index
    items = @list.items
    render json: { status: 'success', data: items }, status: :ok
  end

  def create
    item = Item.new(item_params)
    item.list = @list
    success = item.save

    render_or_unprocessable_entity(success, item, :created)
  end

  def update
    success = @item.update(item_params)

    render_or_unprocessable_entity(success, @item, :ok)
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
