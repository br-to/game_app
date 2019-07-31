class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to micropost_url(@micropost.id)
    else
      flash[:danger] = "コメントできませんでした"
      render 'microposts/show'
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