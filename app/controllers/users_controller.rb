class UsersController < ApplicationController

    def new 
    end 

    def create 
        if params[:password] != params[:password_confirmation]
            redirect_to new_user_path, alert: "Password and Password Confirmation do not match"
        else
            @user = User.new(user_params)
        end
        
        if @user.save
            session[:user_id] = @user.id 
            redirect_to welcome_path
        else 
            redirect_to new_user_path
        end 
    end 

    def welcome 
        @user = User.find(session[:user_id])
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end  

end 