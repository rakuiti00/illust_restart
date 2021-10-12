class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)

    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text,:good_point,:advice).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
