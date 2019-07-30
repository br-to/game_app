class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] 

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "パスワードのリセット用のメールが送られました"
      redirect_to root_url
    else
      flash.now[:danger] = "そのメールアドレスは見つかりませんでした。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?                  
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)          
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      redirect_to @user, success:　"パスワードが変更されました"
    else
      render 'edit'                                     
    end
  end

  private

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  

   
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "パスワードの有効期限が切れています."
        redirect_to new_password_reset_url
      end
    end
end