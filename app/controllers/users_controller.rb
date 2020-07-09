class UsersController < ApplicationController
    before_action :authentication_required, only: [:show, :edit, :destroy]
                # is this a ^callback^ ?
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

    def users 
        redirect_to '/'
    end

    def show
        if current_user == nil
            redirect_to login_path
            flash[:message] = "You must be logged in to access your dashboard"
        else
            @user = User.find_by(id: params[:id])
            authorize(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end
    
    
end
