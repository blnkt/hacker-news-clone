class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to link_path(@comment.link)
    else
      render '/links/show.html.erb'
    end
  end

  def destroy
    @comment = Comment.find(params[:link_id])
    @comment.destroy
    flash[:notice] = "Comment DESTROYED!"
    redirect_to link_path(@comment.link)
  end


private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
