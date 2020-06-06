class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end 

    def show
        render :show
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to signup_path, flash:{notice: "Please complete all required fields."}
        end
    end

    def update
        if @user.update(user_params)
            redirect_to @user, flash:{notice: "Account info updated."}
        else
            redirect_to edit_user_path, flash:{notice: "Please complete all required fields."}
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path, flash:{notice: "Account has been deleted."}
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :quote)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
