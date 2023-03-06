class Business::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def search_customer 
    debugger
    if params[:name]
      @customer = Customer.where("first_name LIKE ?", "%#{params[:name].strip}%")
      if @customer
        @customer
        render :preview
      else
        @msg = "Car does not exist."
        redirect_to  business_customers_path 
      end
    else  
      redirect_to  business_customers_path 
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to  business_customers_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @customer = Customer.new
  end

  def preview 
    @customer = Customer.find(params[:id])
  end


  def delete_customer
    @customer = Customer.find(params[:id])
    @customer.delete 
    flash[:notice] = "Customer been deleted suceessfully."
    redirect_to  business_customers_path 
  end 



  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to  business_customers_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone)
  end
end
