#encoding: utf-8
class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :js
  layout "application"

  # GET /posts
  # GET /posts.json
  def index
    @active_posts = current_user.feed.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id]).increment_with_sql!(:hits, 1)
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to new_post_successful_posts_path, notice: 'Anúncio criado com sucesso.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        @post.review!
        format.html { redirect_to @post, notice: 'Anúncio atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Anúncio removido com sucesso." }
      format.json { head :no_content }
    end
  end

  def new_post_successful; end

  def search
    @posts = Post.simple_search(params[:q])
    @results = @posts.page(params[:page])
  end

  def advanced_search
    @search = Post.active.search(params[:search])
    @advanced_posts = @search.page(params[:page])
    respond_with(@search)
  end

  def pendings
    @pending_posts = Post.pending.page(params[:page])
  end

  def review 
    @review_posts = Post.review.page(params[:page])
  end


  def approve
    @post = Post.find(params[:id]).activate!
    respond_with(@post, :layout => !request.xhr?)
  end

  def reject_to_review
    @post = Post.find(params[:id]).review!
    respond_with(@post, :layout => !request.xhr?)
  end

  def expire
    @post = Post.find(params[:id]).expire!
    respond_with(@post, :layout => !request.xhr?)
  end


end
