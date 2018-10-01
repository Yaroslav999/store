class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :destroy, :show, :update]

  def new
    @item = Item.new
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def update
    if @item.update_attributes(post_params)
      redirect_to @item, success: 'Товар обновлен'
    else
      render :edit, danger: 'Товар не обновлен проверьте данные'
    end
  end

  def create
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def show
  end

  private

  def set_items
    @item = Item.find(params[:id])
  end

  def post_params
    params.require(:item).permit(:name, :body, :price, :image, :category_id)
  end
end
