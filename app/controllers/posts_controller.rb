class PostsController < ApplicationController
  
  before_filter :authenticate, :except => [:show, :index]
  
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @posts }      
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new params[:post]
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, :notice => 'Post Successfully added'}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def show
    @post = Post.find params[:id]
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find params[:id]
    respond_to do |format|
      if @post.update_attributes params[:post]
        format.html {redirect_to @post, :notice => 'Post Successfully updated'}
      else
        format.html {render :action => "edit"}
      end
    end
  end
  
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    
    redirect_to posts_path
  end
  
end
