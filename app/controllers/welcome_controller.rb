class WelcomeController < ApplicationController
  def index
    time = Time.new
    @tweet = Tweet.all
    @tweet_recently = []
    @tweet.each do |tweet|
      if (time - tweet.created_at) <= 900
        @tweet_recently<< tweet
      end
    end
  end

  def about
    @popular_users = User.all.sort_by { |user| user.msg_amount }.reverse.take(3)
  end
end
