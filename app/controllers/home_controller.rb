class HomeController < ApplicationController
  rescue_from Twitter::Error::NotFound, Twitter::Error::Unauthorized, with: :not_found

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

  def not_found
    flash[:danger] = I18n.t('handle_not_found')
    redirect_to action: :index, handle: params[:handle]
  end
end
