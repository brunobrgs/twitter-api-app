module ApplicationHelper
  include Twitter::Autolink

  def tweet_link(tweet)
    raw(auto_link tweet.text, target_blank: true, username_include_symbol: true)
  end
end
