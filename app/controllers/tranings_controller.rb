class TraningsController < ApplicationController
  
  def index
    random_id = rand(Traning.count)+1

    # 存在しないIDの場合、一旦ダミー用のID情報を表示する。
    if Traning.exists?(id: random_id)
      @traning = Traning.find(random_id)
    else
      @traning = Traning.find(1)
    end
    
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
