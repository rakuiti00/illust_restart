class TraningsController < ApplicationController
  
  def index
    @traning = Traning.order("RAND()").first
    @posts = Post.where(traning_flag: true).where(traning_id: @traning.id)
  end

  def new
    @traning = Traning.new
  end

  def create
    @traning = Traning.new(traning_params)

    if @traning.save
      redirect_to tranings_path
    else
      render :new
    end
  end

  private
  
  def traning_params
    params.require(:traning).permit(:theme_text,:image)  
  end

end
