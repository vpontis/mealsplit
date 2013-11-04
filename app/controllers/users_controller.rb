class UsersController < ApplicationController
  before_filter :is_admin,      only: [:index]
  before_filter :is_current_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    name = params[:user][:name]
    @user.name = name
    if @user.save 
      flash[:success] = "Successfully changed user name"
      redirect_to user_path(@user)
    end
  end

private
  def is_admin
    if current_user.nil?
      flash[:danger] = 'Sorry you are not logged in.'
      redirect_to root_path
    elsif current_user.admin == false
      flash[:danger] = 'Sorry you are not an admin user.'
      redirect_to root_path
    end
  end

  def is_current_user
    if current_user.nil?
      flash[:danger] = "You must log in to have user actions."
      redirect_to root_path
    end
    if params[:id].to_i != current_user.id && !current_user.admin?
      flash[:danger] = "Sorry you are not able to view this users information."
      redirect_to root_path
      return
    end
  end
end
