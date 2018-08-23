class ItemsController < ApplicationController
  def new
  	
  end

  def destroy
    @item = Item.find(params[:id])  	
    @item.destroy
    redirect_to items_path
  end

  def index
  	@items = Item.all
  end

  def create
    @item = Item.new(params.require(:item).permit(:name, :body, :price))
    @item.save
    redirect_to @item
  end

  def show
    @item = Item.find(params[:id])  	
  end
end
