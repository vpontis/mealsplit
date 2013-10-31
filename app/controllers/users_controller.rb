class UsersController < ApplicationController
  before_filter :is_admin,      only: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
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

end
