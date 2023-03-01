class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @total = @item.orders.count
    @total_quantity = @item.orders.sum("quantity")
  end
  def edit
    @item = Item.unscoped.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def update
    @item = Item.unscoped.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show_all
    @items = Item.unscoped.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def destroy
    @item = Item.unscoped.find(params[:id])
    @item.destroy
    redirect_to items_path

  end


  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :capicity, :is_active, :status)
  end
end
