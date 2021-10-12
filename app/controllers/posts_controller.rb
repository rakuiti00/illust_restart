class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
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
    params.require(:post).permit(:title, :description,:advice_flag,:traning_flag,:image).merge(user_id: current_user.id)
  end

end
