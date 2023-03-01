class Order < ApplicationRecord
  enum :status, { "Booked": 1, "Cancelled": 3, "Delivered": 2 }
  belongs_to :customer
  belongs_to :item

  scope :top_customers_by_item, -> {
    group(:item_id, :customer_id).sum(:quantity).sort_by { |k, v| -v }.first(3).map { |k, v| [Customer.find(k[1]), Item.find(k[0]), v] }
  }

  scope :top_customers_by_price, ->{ 
    group(:item_id, :customer_id).sum(:total_price).sort_by { |k, v| -v }.first(3).map { |k, v| [Customer.find(k[1]), Item.find(k[0]), v] }
  }

  scope :top_customers_by_orders, -> {
    Customer.joins(:orders).select("customers.*, COUNT(orders.id) AS orders_count").group("customers.id").order("orders_count DESC").limit(5)
  }

  scope :top_customers_by_canceled_orders, -> {
    Customer.joins(:orders).where(orders: { status: :Cancelled }).select("customers.*, COUNT(orders.id) AS canceled_orders_count").group("customers.id").order("canceled_orders_count DESC").limit(5)
  }
end
