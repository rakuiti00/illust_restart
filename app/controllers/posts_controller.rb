class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :move_to_index, only:[:edit]

  def index
    @posts = Post.includes(:user).order("updated_at DESC")
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
    @comments = @post.comments.includes(:user)
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
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to root_path
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

end
