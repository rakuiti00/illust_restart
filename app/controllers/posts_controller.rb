class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :move_to_index, only:[:edit]
  before_action :lgtm, only:[:new,:create,:edit,:update]

  def index
    @posts = Post.includes(:user).order("updated_at DESC").page(params[:page]).per(8)
  end

  def new
    @post = Post.new

    if params[:traning_id]
      @traning_id = params[:traning_id]  
    else
      @traning_id = 1
    end

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new      
    end
  end

  def show
    @post = Post.find(params[:id])
    @like_count = Like.where(post_id: params[:id]).count
    @comment = Comment.new
    @comments = @post.comments.includes(:user).page(params[:page]).per(3)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end  
  end

  def destroy
    post = Post.find(params[:id])

    if post.user_id = current_user.id 
       post.destroy
      redirect_to root_path  
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description,:advice_flag,:traning_flag,:image,:traning_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @post = Post.find(params[:id])

    if !(user_signed_in? && current_user.id == @post.user.id)
      redirect_to root_path
    end
  end

  def lgtm
    # lgtmテスト----------------------------------------------------------
    @user = User.find(current_user.id)
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
    #  @likes_count = 100
    if @likes_count >=  100
      render template: "users/lgtm"
    end
    #--------------------------------------------------------------------
  end

end
