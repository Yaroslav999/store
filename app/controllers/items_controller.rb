class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def index
    @items = Item.all
  end

  def edit

  end

  def update
    @item = Item.new(post_params)
    if @item.update_attributes(post_params)
      redirect_to(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(post_params)
    @item.save
    redirect_to @item
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def post_params
    params.require(:item).permit(:name, :body, :price)
  end
end
