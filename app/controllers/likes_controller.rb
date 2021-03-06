class LikesController < ApplicationController
	def index
		@user = current_user
		@secret = Secret.find(params[:secret_id])
		like = Like.new(user:@user,secret:@secret)
		if like.valid?
			like.save
		else
			flash[:errors] = like.errors.full_messages
		end
		redirect_to :back
	end

	def destroy
		like = Like.where(:user_id=>current_user.id).where(:secret_id=>params[:secret_id]).first
		if like != nil
			like.destroy
		end
		redirect_to :back
	end
end
