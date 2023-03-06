class UsersController < ApplicationController

    skip_before_action :require_login?


    def new 
        @user = User.new 
    end 
    def create
        user = User.find_by(email: user_params[:email])
        if user 
            flash[:notice] = "Email already in use."
            @user = User.new 
            render :new, status: :unprocessable_entity
        else
            user = User.new(user_params)
            if user.save
                flash[:notice] = "Successfully Registered."
                redirect_to login_path
            else
                flash[:notice] = "unknown error."
                @user = User.new 
                render :new, status: :unprocessable_entity
            end
        end
    end

    def login
        @user = User.new 
    end

    def log_in 
        user = User.find_by(email: user_params[:email])
        if user 
            if user.password = user_params[:password]
                flash[:notice] = "Successfully loged in."
                cookies[:name] = user.name
                session[:current_user_id] = user.id
                redirect_to orders_path
            else  
                flash[:notice] = "Wrong credentials."
                redirect_to login_path
            end
        else
            flash[:notice] = "User does not exist."
            redirect_to login_path
        end
    end

    def logout
            session.clear
            cookies.delete(:name)
            redirect_to login_path
    end

    private
    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end
end
