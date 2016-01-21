[![Build Status](https://semaphoreci.com/api/v1/projects/d7a489c4-fb49-45f7-966d-c201fef90869/668478/shields_badge.svg)](https://semaphoreci.com/brunorails/twitter-api-app)

# Twitter API app

* Usign PG as database, we don't need to store any data, just user, so we could just use sqlite, but heroku does not support it
* Using Devise for authentication
* Using Rspec and Capybara for tests
* Twitter bootstrap
* When fetching the tweets, there is an option to force refresh (To avoid the 5 minutes cache)
* When you change the hadle, cache will be automatic updated

# Setup

* Configure API_KEY and API_SECRET at .env file
* <tt>bundle install</tt>
* <tt>rake db:create</tt>
* <tt>rake db:migrate</tt>
* <tt>rails s</tt>

# Testing

* <tt>RAILS_ENV=test rake db:create</tt>
* <tt>RAILS_ENV=test rake db:migrate</tt>
* <tt>rspec</tt>

# Heroku

* Install Heroku
* <tt>heroku login</tt>
* <tt>heroku create</tt>
* <tt>git push heroku master</tt>
* <tt>heroku run rake db:migrate</tt>
* <tt>heroku open</tt>
