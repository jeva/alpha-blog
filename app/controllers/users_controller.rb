class UsersController < ApplicationController
  
  before_action :set_users, only: [:edit, :update, :show]
  
  def new
    @user = User.new
  end

 def create
  @user = User.new(user_params)
  
  if @user.save
    flash[:success] = "Welcome to the alpha blog #{@user.username}"
    redirect_to articles_path
  else
    render 'new'
  end
 end
 
 def edit
 end
 
 def update
 
 if @user.update(user_params)
   flash[:success] = "Your account was updated sucessfully"
   redirect_to articles_path
 else
   render 'edit'
 end
end 

def index
  @user = User.all
end

 
 private
 
 def user_params
  params.require(:user).permit(:username, :email, :password)
 end

 def set_users
  @user = User.find(params[:id])
 end
 
end

 