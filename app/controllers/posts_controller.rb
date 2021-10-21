class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_post,only:[:edit,:show,:update,:destroy,:move_to_index]
  before_action :move_to_index, only:[:edit]
  before_action :lgtm, only:[:new,:create,:edit,:update]

  def index
    @posts = Post.includes(:user).order("updated_at DESC").page(params[:page]).per(12)
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
    @like_count = Like.where(post_id: params[:id]).count
    @comment = Comment.new
    @comments = @post.comments.includes(:user).page(params[:page]).per(3)
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end  
  end

  def destroy
    post = Post.find(params[:id])

    if post.user_id == current_user.id 
       post.destroy
       redirect_to root_path  
    end
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(8)
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :description,:advice_flag,:traning_flag,:image,:traning_id).merge(user_id: current_user.id)
  end

  def move_to_index
    if !(user_signed_in? && current_user.id == @post.user.id)
      redirect_to root_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def lgtm
    @user = User.find(current_user.id)
    @posts = @user.posts
    @likes_count = 0

    # そのユーザーに関するLikeテーブルの投稿データのカウントで合計値を取得
    @posts.each do |post|
      @likes_count += post.likes.count
    end

    # (テスト用)@likes_count = 100
    if @likes_count >=  100
      render template: "users/lgtm"
    end
  end
end
