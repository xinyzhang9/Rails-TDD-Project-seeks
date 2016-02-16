class UsersController < ApplicationController
	before_action :require_login,except:[:new,:create]
	before_action :require_correct_user, only:[:show,:edit,:update,:destroy]
	# attr_accessor :password
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
  		session[:user_id] = @user.id
  		redirect_to @user
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.name= params[:name]
  	user.email = params[:email]
  	# user.password = user.password
  	if !user.save
  		flash[:errors] = user.errors.full_messages
  	end
  	redirect_to user

  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	reset_session
  	redirect_to "/sessions/new"
  end

  private
  def user_params
  	params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end

end
