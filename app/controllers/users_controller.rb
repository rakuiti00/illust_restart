class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # ユーザーに関する投稿を全て取得
    @posts = @user.posts

    #いいね数カウント用
    @likes_count = 0
    # そのユーザーに関する投稿情報を１つずつ確認し、いいねテーブルにデータ
    # その投稿データがあればカウントを＋１して合計値を取得
    @posts.each do |post|
      @likes_count += post.likes.count
    end

    # (テスト用) 総いいね数が一定ライン(一旦100)を越えたら卒業ページに飛ばす
    # @likes_count = 100
    # if @likes_count >=  100
    #   render :lgtm
    # end

  end

end
