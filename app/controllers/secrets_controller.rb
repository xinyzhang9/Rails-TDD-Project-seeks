class SecretsController < ApplicationController
	before_action :require_login, only: [:index,:create,:destroy]
  def index
  	@secrets = Secret.all
  end

  def create
  	user_id = params[:id]
  	@user = User.find(user_id)
  	secret = Secret.new(content:params[:content],user:@user)
  	if secret.valid?
  		secret.save
  		redirect_to @user
  	else
  		flash[:errors] = secret.errors.full_messages
  		redirect_to @user
  	end
  end

  def destroy
  	secret = Secret.find(params[:id])
  	user = secret.user
  	secret.destroy if user == current_user
  	redirect_to "/users/#{current_user.id}"
  end
end
