class LikesController < ApplicationController

  def create
      
    @like = Like.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @like.save

    post = Post.find(params[:post_id])

    # 遷移元によって遷移先を変えたい
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "posts" && path[:action] == "show"
      redirect_to(post_path(params[:post_id]))
    elsif path[:controller] == "posts" && path[:action] == "index"
      redirect_to(root_path)
    elsif path[:controller] == "users" && path[:action] == "show"
      redirect_to(user_path(post.user_id))
    elsif path[:controller] == "tranings" && path[:action] == "index"
      redirect_to(tranings_path)
    else
      redirect_to(root_path)
    end
  end

  def destroy
    @like = Like.find_by(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @like.destroy

    # 遷移元によって遷移先を変えたい
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "posts" && path[:action] == "show"
      redirect_to(post_path(params[:post_id]))
    elsif path[:controller] == "posts" && path[:action] == "index"
      redirect_to(root_path)
    elsif path[:controller] == "users" && path[:action] == "show"
      redirect_to(user_path(post.user_id))
    elsif path[:controller] == "tranings" && path[:action] == "index"
      redirect_to(tranings_path)
    else
      redirect_to(root_path)
    end
  end

end
