class Link < ActiveRecord::Base
  before_save :url_checker
  # has_many :comments
  has_many :comments, as: :commentable
  validates :url, :presence => true

  def vote
  self.update(votes: self.votes + 1)
  end

  def score
    days_elapsed = (Time.new - self.created_at)/60.0/60/24
    self.votes/days_elapsed
  end

  def self.order_by_score
    self.all.sort_by {|link| link.score }.reverse
  end

  private
  def url_checker
    self.url.delete!("http://") if self.url.start_with?("http://")
  end
end
