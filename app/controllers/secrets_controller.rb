class SecretsController < ApplicationController
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
end
