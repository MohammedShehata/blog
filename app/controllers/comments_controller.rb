class CommentsController < ApplicationController
  
  before_filter :authenticate, :only => :destroy
  
  def create
    @post = Post.find params[:post_id]
    @post.comments.create params[:comment]
    
    respond_to do |format|
      format.html{redirect_to @post}
    end
  end
  
  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    
    redirect_to @comment.post
  end
  
end
