class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("updated_at DESC").page(params[:page]).per(8)
    @like_posts = @user.posts

    @likes_count = 0

    @like_posts.each do |post|
      @likes_count += post.likes.count
    end
  end

end
