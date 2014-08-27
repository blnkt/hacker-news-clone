class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = Comment.new(commentable_type: @commentable.class.to_s, commentable_id: @commentable.id, text: comment_params[:text])
    @link = @commentable
    @comments = @commentable.comments
    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to link_path(@comment.commentable)
    else
      render '/links/show.html.erb'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment DESTROYED!"
    redirect_to link_path(@comment.commentable)
  end


private
  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
  def comment_params
    params.require(:comment).permit(:text)
  end
end
