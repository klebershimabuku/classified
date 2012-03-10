class PagesController < ApplicationController
  layout "posts", only: :home

  def home
    @posts = Post.active.page(params[:page])
  end

  def welcome
  end

end
