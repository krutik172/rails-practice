class BookController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @authors = Author.all
    @book = Book.new
  end

  def create
    @book = Book.create(form_params)
    redirect_to :action => "index"
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def update
    # debugger
    @book = Book.find(params[:id])
    # debugger
    @book.update(form_params)
    redirect_to :action => "index"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => "index"
  end

  private

  def form_params
    params.require(:book).permit(:name, :price, :author_id)
  end
end
