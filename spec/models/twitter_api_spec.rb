require 'rails_helper'

describe TwitterApi do
  let(:twitter_client) { double(:twitter_client) }
  let(:client) { double(:client) }

  subject do
    described_class.new('BlizzardCS', twitter_client: twitter_client)
  end

  describe '#search' do
    it 'gets the tweets' do
      expect(twitter_client).to receive(:new).and_return(client)
      expect(client).to receive(:user_timeline).with('BlizzardCS', count: 25)
      subject.search
    end
  end
end
