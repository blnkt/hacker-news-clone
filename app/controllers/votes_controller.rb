class VotesController < ApplicationController

  def update
    @link = Link.find(params[:id])
    @link.vote
    flash[:notice] = "Vote added!"
    redirect_to link_path(@link)
  end
end
