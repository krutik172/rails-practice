class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    # debugger
    @student = Student.create(form_params)
    # debugger
    if (@student.save)
      redirect_to :action => "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:student).permit(:first_name, :last_name, :department, :birthdate, :terms)
  end
end
