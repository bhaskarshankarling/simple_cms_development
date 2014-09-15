class AdminUsersController < ApplicationController

  layout 'admin'
  before_action :confirm_login_action

  def index
  	@users = AdminUser.sorted
  end

  def new
  	@user = AdminUser.new
  end

  def create
  	@user =  AdminUser.new(admin_user_param)
  	if @user.save
  		flash[:notice] = "user created successfully"
  		redirect_to(:action => 'index')
  	else
  		render('new')
  	end
  end

  def edit
  	@user = AdminUser.find(params[:id])
  end

  def update
  	@user = AdminUser.find(params[:id])
  	if @user.update_attributes(admin_user_param)
  		flash[:notice] = "User updated successfully"
  		redirect_to(:action => 'index')
  	else
  		render('edit')
  	end
  end

  def delete
  	@user = AdminUser.find(params[:id])

  end

  def destroy
  	user = AdminUser.find(params[:id]).destroy
  	flash[:notice] = "User #{user.username} detroyed successfully"
  	redirect_to(:action => 'index')
  end

  private
  def admin_user_param
  	params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
