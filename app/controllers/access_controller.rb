class AccessController < ApplicationController
  
  layout 'admin'

  before_action :confirm_login_action, :except => [:login, :attempt_login, :logout ]
  def index
  end

  def login
  	if session[:user_id]
  		redirect_to(:action => 'index')
  	end
  end

  def attempt_login
  	if params[:username].present?  &&  params[:password].present?
  	   found_user = AdminUser.where(:username => params[:username]).first
  	   if found_user
  			authorize_user = found_user.authenticate(params[:password])
  	   end
  	end

  	if authorize_user
  		session[:user_id] = authorize_user.id
  		session[:username] = authorize_user.username
  		flash[:notice] = "You are now logged in"
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Invalid Username/Password" 
  		redirect_to(:action => 'login')
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:username] = nil
  	flash[:notice] = "You are logged out"
  	redirect_to(:action => 'login')
  end

end
