class PagesController < ApplicationController
#  layout "posts", only: :home
  respond_to :html, :js

  def home
    @posts = Post.active.page(params[:page])
  end

  def welcome
  end

  def successfulsignup; end

  def contact
    @subject  = params[:subject]
    @from     = params[:from]
    @message  = params[:message]
    @sender_name = params[:sender_name]
    Mailer.contact_form(@sender_name, @from, @subject, @message).deliver
    respond_with(@sender_name)
  end

  def tos
  end

end
