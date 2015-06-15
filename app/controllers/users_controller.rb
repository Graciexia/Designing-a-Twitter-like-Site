class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :allowed_to_modify_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "New User successfully created"
    else
      flash[:alert] = "Error Occured"
      render :new
    end
  end

  def edit
     set_user
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_user
    @user.destroy(user_params)
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def allowed_to_modify_user
    set_user
    if @user.id != current_user.id
      redirect_to users_path, alert: "Users can only modify themselves."
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :photo_url)
  end

end
