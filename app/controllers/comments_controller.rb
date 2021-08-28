class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

  def create
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new(comments_params)
    @comment.tweet = @tweet
    @comment.user = current_user
    @comment.save
    redirect_to @tweet
  end

  def update
    if @comment.updated(comments_params)
      redirect_to @comment.tweet
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to :tweet, notice: 'Comment deleted!'
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
