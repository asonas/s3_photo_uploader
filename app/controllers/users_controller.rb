class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def create
    @user = User.create( params[:user] )
  end

  def delete
  end

end
