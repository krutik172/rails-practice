class EmployeesController < ApplicationController
  def index
    if params[:email]
      @employee = Employee.find_by(email: params[:email].strip)

      unless @employee
        @employees = Employee.all
        @msg = "Employee not found."
      end
    else
      @employees = Employee.all
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_initialize_by(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def increase
    Employee.limit(10).find_in_batches(batch_size: 2).each do |emp|
      emp.each do |e|
        e.no_of_order += 1
        e.save
      end
    end
    redirect_to employees_path
  end

  def decrease
    Employee.find_in_batches(batch_size: 10).each do |emp|
      emp.each do |e|
        e.no_of_order -= 1
        e.save
      end
    end
    redirect_to employees_path
  end

  def show_employee
    @employee_age_20_to_40 = Employee.where(age: [20...40])
    @employee_full_time_available = Employee.where(full_time_available: true)
    @employee_no_of_order_5_and_age_greater_than_25 = Employee.where("age > 25").where(no_of_order: 5)
    @employee_no_of_order_5_and_age_less_than_25 = Employee.where("age < 25").or(Employee.where(no_of_order: 5))
    @employee_created_before_today = Employee.where(created_at: ..(Time.now.midnight))
    @employee_age_desc = Employee.all.order("age desc")
    @emmployee_no_of_order_asc = Employee.all.order("no_of_order asc")
    @employee_salary_45000 = Employee.where("salary > 25000")
    @employee_group_by_order_more_than_5 = Employee.select(:id, :first_name, :last_name, :age, :email, :salary, :no_of_order).group(:id, :first_name, :last_name, :age, :email, :salary, :no_of_order).where(no_of_order: 6..)
    @employee_unscope = Employee.all.where(salary: 26000...).order("id desc").unscope(:where)
    @employee_reselect = Employee.select(:no_of_order, :age, :salary).reselect(:first_name, :last_name, :age, :email, :salary)
    @employee_only = Employee.where(salary: 26000..).select(:no_of_order, :age, :salary).only(:where)
  end

  def destroy
    @employee = Employee.find(params[:id])

    @employee.destroy

    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :age, :email, :no_of_order, :full_time_available, :salary)
  end
end
