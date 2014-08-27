require 'rails_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should have_many :comments }

  describe '#vote' do
    it 'votes up a link' do
      new_link = Link.create(url: 'chancestoriestold.com')
      new_link.vote
      expect(new_link.votes).to eq(1)
    end
  end

  describe ".order_by_score" do
    it "orders links based on votes and when it was posted" do
      new_link = Link.create(url: 'chancestoriestold.com')
      new_link2 = Link.create(url: 'chancestoriestold.com')
      new_link2.vote
      new_link2.vote
      new_link2.vote
      expect(Link.order_by_score).to eq([new_link2, new_link])
    end
  end
end
