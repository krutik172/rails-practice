class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def create
    # debugger
    @faculty = Faculty.create(form_params)
    # debugger
    if (@faculty.save)
      redirect_to :action => "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:faculty).permit(:name, :phone, :email, :designation)
  end
end
