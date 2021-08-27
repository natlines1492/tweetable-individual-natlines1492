class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to :root, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
