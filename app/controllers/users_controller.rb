class UsersController < ApplicationController
    before_action :authentication_required, only: [:show, :edit, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #byebug
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        
        @user = User.find_by(id: params[:id])
        authorize
        #redirect_to '/login' if !@user 
        
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end
    
    
end
