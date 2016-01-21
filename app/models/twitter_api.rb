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
      config.consumer_key    = ENV['API_KEY'] || 'PB8NzsvSUedoTkfNq0Neq9ZV6'
      config.consumer_secret = ENV['API_SECRET'] || 'SB3h6G1XEugkrl93hDqXjdGVp9tHXpfeow5Mu5BtXZ30mPpx4k'
    end
  end
end
