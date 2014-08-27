class LinksController < ApplicationController
  def index
    @links = Link.all
    @hotlinks = Link.order_by_score
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link added!"
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def show
    if params[:id]
      @link = Link.find(params[:id])
    else
      @link = Link.find(params[:link_id])
    end
    @commentable = @link
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Link updated!"
      redirect_to link_path(@link)
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.comments.destroy_all
    @link.destroy
    flash[:notice] = "Link and associated comments DESTROYED!"
      redirect_to links_path
  end

private
  def link_params
    params.require(:link).permit(:url)
  end
end
