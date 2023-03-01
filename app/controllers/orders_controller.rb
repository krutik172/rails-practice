class OrdersController < ApplicationController
  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    elsif params[:title]
      @item = Item.find_by(title: params[:title].strip)

      if @item
        @orders = @item.orders
      else
        @msg = "Item does not exist."
        @orders = Order.all
      end
    else
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
    @customers = Customer.all
    @items = Item.all
  end

  def create
    @order = Order.new(order_params)
    @order.total_price = @order.item.price * order_params[:quantity].to_i

    if @order.save
      redirect_to all_orders_path
    else
      @customers = Customer.all
      @items = Item.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
    @customers = Customer.all
    @items = Item.all
  end

  def update
    @order = Order.find(params[:id])
    @order.total_price = @order.item.price * order_params[:quantity].to_i
    if @order.update(order_params)
      redirect_to all_orders_path
    else
      @customers = Customer.all
      @items = Item.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])

    order.destroy
    redirect_to all_orders_path
  end

  def display
  @o1 =  Order.top_customers_by_item
  @o2 =  Order.top_customers_by_price
  @o3 =  Order.top_customers_by_orders
  @o4 =  Order.top_customers_by_canceled_orders
  end 
  private

  def order_params
    params.require(:order).permit(:item_id, :quantity, :customer_id, :status)
  end
end
