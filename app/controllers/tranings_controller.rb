class TraningsController < ApplicationController
  def index
    random_id = rand(Traning.count)+1
    @traning = Traning.find(random_id)
    @posts = Post.where(traning_flag: true).where(traning_id: @traning.id)

  end

  def new
    @traning = Traning.new
  end

  def create
    @traning = Traning.new(traning_params)

    @traning.valid?
    if @traning.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def traning_params
    params.require(:traning).permit(:theme_text,:image)
    
  end

end
