class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @msg_amount = Tweet.joins('join users on tweets.user_id = users.id').count(user_id)
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
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
