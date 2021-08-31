class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(tweet_id: @tweet.id)
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comments_params)
    @comment.tweet = @tweet
    @comment.user = current_user
    if @comment.save
      redirect_to @tweet, notice: 'Comment was successfully created.'
    else
      redirect_to @tweet, alert: 'Something failed'
    end
  end

  def edit; end

  def update
    if @comment.updated(comments_params)
      redirect_to @comment.tweet
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @tweet, notice: 'Comment deleted!'
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :tweet_id)
  end
end
