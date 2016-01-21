require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.ignore_localhost = true

  config.ignore_request do |request|
    uri = URI(request.uri)
    uri.path == '/oauth2/token'
  end
end
