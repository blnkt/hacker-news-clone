class Link < ActiveRecord::Base
  before_save :url_checker
  has_many :comments
  validates :url, :presence => true

  def vote
  self.update(votes: self.votes + 1)
  end

  private
  def url_checker
    self.url.delete!("http://") if self.url.start_with?("http://")
  end
end
