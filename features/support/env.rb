# TODO: Fill in allow_urls
# TODO: Configure databsase cleaner

require "capybara/cucumber"
require "capybara-webkit"
require 'capybara-screenshot'
require "net/http"
require_relative "helpers/endpoint_helper"
require_relative "helpers/navigation_helper"
require_relative "helpers/user_helper"

Capybara.configure do |config|
  config.app_host = EndpointHelper.app_base
  config.default_driver = :webkit
  config.run_server = false
end

Capybara::Webkit.configure do |config|
  config.allow_url ""
  config.allow_url ""
  config.allow_url ""
end

Before do
  cleaner_url = "#{EndpointHelper.cleaner_base}/ "
  Net::HTTP.get(URI.parse(cleaner_url))
end

Capybara.ignore_hidden_elements = false

Capybara::Screenshot.prune_strategy = :keep_last_run

World(NavigationHelper, UserHelper)
