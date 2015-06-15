class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :allowed_to_modify_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def show
    set_tweet
  end

  def new
    @tweets = Tweet.new
    @all_users = User.select_users
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_tweet
    @all_users = User.select_users
  end

  def update
    set_tweet
    if @tweet.update (tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_tweet
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end

  def allowed_to_modify_tweet
    set_tweet
    if @tweet.user_id != current_user.id
      redirect_to tweets_path, alert: "Users can only modify their own tweets."
    end
  end
end
