class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    render :index
  end

  def turns_manager
    @user = User.find(params[:id]).manager!
    respond_with(@user, :layout => !request.xhr?)
  end

  def turns_moderator
    @user = User.find(params[:id]).moderator!
    respond_with(@user, :layout => !request.xhr?)
  end

  def turns_user
    @user = User.find(params[:id]).user!
    respond_with(@user, :layout => !request.xhr?)
  end

end
