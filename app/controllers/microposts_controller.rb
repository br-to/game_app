class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:index, :show, :create, :destroy]
    before_action :correct_user,   only: :destroy

  def index
    @microposts = Micropost.all.order(created_at: :desc)
  end
  
  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user
    @comments = @micropost.comments
    @comment = @micropost.comments.build 
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿されました!"
      redirect_to root_url
    else
      @feed_items = []
      render 'game_share/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿が削除されました!"
    redirect_back(fallback_location: root_url)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content,:title,:picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end