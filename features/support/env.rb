require "capybara/cucumber"
require "capybara-webkit"
require 'capybara-screenshot'
require "net/http"
require_relative "helpers/endpoint_helper"
require_relative "helpers/user_helper"

Capybara.configure do |config|
  config.app_host = 'http://localhost:8080' #EndpointHelper.app_base
  config.server_host = 'localhost'
  config.server_port = '8080'
  config.default_driver = :webkit
  config.run_server = false
end

Capybara::Webkit.configure do |config|
end

# Before do
#   cleaner_url = "#{EndpointHelper.cleaner_base}/clean-database"
#   Net::HTTP.get(URI.parse(cleaner_url))
# end

Capybara.ignore_hidden_elements = false

Capybara::Screenshot.prune_strategy = :keep_last_run

World(UserHelper)
