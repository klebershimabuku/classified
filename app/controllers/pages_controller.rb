class PagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = Post.feed.page(params[:page])
    end
  end
end
