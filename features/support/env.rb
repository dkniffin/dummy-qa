require "capybara/cucumber"
require "capybara-webkit"
require 'capybara-screenshot'
require "net/http"
require_relative "helpers/user_helper"

Capybara.configure do |config|
  config.app_host = 'http://localhost:8080'
  config.server_host = 'localhost'
  config.server_port = '8080'
  config.default_driver = :webkit
  config.run_server = false
end

Capybara::Webkit.configure do |config|
end

Capybara.ignore_hidden_elements = false

Capybara::Screenshot.prune_strategy = :keep_last_run

World(UserHelper)
