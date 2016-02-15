class UsersController < ApplicationController
	def index
	end
  def show
  	@user = User.find(params[:id])
  end

  def new
  end

  def create
  	@user = User.new(user_params)
  	if !@user.save
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  		
  	else
  		@user.save
  		redirect_to @user
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end
end
