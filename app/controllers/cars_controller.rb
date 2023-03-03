require "prawn"

class CarsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: :download_pdf

  def index
    if params[:model]
      @cars = Car.where("model LIKE ?", "%#{params[:model].strip}%")
            if @cars
        @cars
      else
        @msg = "Car does not exist."
        @cars = Car.all
      end
    else
      @cars = Car.all
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car saved."
      redirect_to cars_path
    else
      flash[:notice] = "Error occured."
      render :new, status: :unprocessable_entity
    end
  end

  def download_pdf
    cars = Car.all
    send_data generate_pdf(cars),
              filename: "cars.pdf",
              type: "application/pdf"
  end

  private

  def car_params
    params.require(:car).permit(:company, :model, :price, :fuel_type, :capacity)
  end

  def generate_pdf(cars)
    Prawn::Document.new do
      cars.each do |car|
        text "#{car.model}", align: :center
        text "Company: #{car.company}"
        text "Price: #{car.price}"
      end
    end.render
  end
end
