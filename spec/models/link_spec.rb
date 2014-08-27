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
end
