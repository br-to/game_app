class LikesController < ApplicationController
    before_action :logged_in_user

    def create
        @micropost = Micropost.find(params[:micropost_id])
        unless @micropost.favo?(current_user)
          @micropost.favo(current_user)
          respond_to do |format|
            format.html { redirect_to request.referrer || root_url }
            format.js
          end
        end
      end
    
      def destroy
        @micropost = Like.find(params[:id]).micropost
        if @micropost.favo?(current_user)
          @micropost.unfavo(current_user)
          respond_to do |format|
            format.html { redirect_to request.referrer || root_url }
            format.js
          end
        end
      end
end
