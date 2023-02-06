class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: params[:id])
  end

  def create
    @author = Author.create(form_params)
    redirect_to :action => "index"
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    # binding.pry
    author = Author.find(params[:id])
    # binding.pry
    author.update(form_params)
    # binding.pry
    redirect_to :action => "index"
  end

  private

  def form_params
    params.require(:author).permit(:first_name, :last_name, :dob)
  end
end
