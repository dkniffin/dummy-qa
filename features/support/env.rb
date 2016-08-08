# TODO: Fill in allow_urls
# TODO: Configure database cleaner
# TODO: Remove comments

require "capybara/cucumber"
require "capybara-webkit"
require 'capybara-screenshot'
require "net/http"
require_relative "helpers/endpoint_helper"
require_relative "helpers/user_helper"

Capybara.configure do |config|
  config.app_host = EndpointHelper.app_base
  config.default_driver = :webkit
  config.run_server = false
end

Capybara::Webkit.configure do |config|
  config.allow_url "" # TODO
  config.allow_url "" # TODO
  config.allow_url "" # TODO
end

Before do
  cleaner_url = "#{EndpointHelper.cleaner_base}/clean-database"
  # TODO: Please let BE know to add the following to the route.rb file:
  # if Rails.env.in? %(test qa development demo)
  #   namespace :qa do
  #     get 'clean-database', controller: 'database'
  #   end
  # end
  # And sets up the appropriate controller actions (see Eklatz for an example):
  # https://github.com/smashingboxes/eklatz-api/blob/master/app/controllers/api/v1/qa/database_controller.rb
  Net::HTTP.get(URI.parse(cleaner_url))
end

Capybara.ignore_hidden_elements = false

Capybara::Screenshot.prune_strategy = :keep_last_run

World(UserHelper)
