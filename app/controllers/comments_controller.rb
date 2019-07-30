class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(params_comment)
    if @comment.save
      redirect_back(fallback_location: micropost_url(@micropost.id))
      flash[:success] = "コメントしました"
    else
      redirect_back(fallback_location: micropost_url(@micropost.id))
      flash[:danger] = "コメントできませんでした"
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: micropost_path(@micropost))
  end

  private

  def params_comment
    params.require(:comment).permit(:content)
  end
end