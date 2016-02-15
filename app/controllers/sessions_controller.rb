class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  end

  def login
  	email = params[:email]
  	user = User.find_by_email(email)
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/users/#{user.id}"
  	else
  		flash[:errors] = ['Invalid combination']
  		redirect_to "/sessions/new"
  	end
  end

  def delete
  	reset_session
  	redirect_to "/sessions/new"
  end
end
