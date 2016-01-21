class HomeController < ApplicationController
  def index
  end

  def tweets
    Rails.cache.delete('tweets') if need_refresh?

    @tweets = Rails.cache.fetch('tweets', expires_in: 5.minutes) do
      TwitterApi.search(params[:handle])
    end

    Rails.cache.write('handle', params[:handle])

    render 'index'
  end

  private

  def need_refresh?
    # When marked to refresh or changes the handle
    params[:refresh] == '1' || Rails.cache.fetch('handle') != params[:handle]
  end
end
