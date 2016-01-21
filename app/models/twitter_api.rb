class TwitterApi
  def initialize(handle, options = {})
    @handle = handle
    @twitter_client = options.delete(:twitter_client) { Twitter::REST::Client }
  end

  def self.search(*attr)
    new(*attr).search
  end

  def search
    client.user_timeline(handle, count: 25)
  end

  private

  attr_reader :handle, :twitter_client

  def client
    @client ||= twitter_client.new do |config|
      config.consumer_key    = ENV['API_KEY'] || '12345'
      config.consumer_secret = ENV['API_SECRET'] || '12345'
    end
  end
end
