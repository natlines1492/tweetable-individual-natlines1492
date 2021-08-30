class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[new create update destroy]
  before_action :own_tweet, only: %i[update destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.user = current_user
    @tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @tweet.destroy
    redirect_to :root, notice: 'Tweet was successfully destroyed.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def own_tweet
    return if current_user == @tweet.user

    redirect_to(@tweet, notice: 'You cannot modify this tweet')
  end
end
