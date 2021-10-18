class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # ユーザーに関する投稿を全て取得
    @posts = @user.posts.order("updated_at DESC").page(params[:page]).per(8)
    @like_posts = @user.posts

    #いいね数カウント用
    @likes_count = 0
    # そのユーザーに関する投稿情報を１つずつ確認し、いいねテーブルにデータ
    # その投稿データがあればカウントを＋１して合計値を取得
    @like_posts.each do |post|
      @likes_count += post.likes.count
    end
  end

end
