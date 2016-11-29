require_relative "boot"

require "rails/all"

Bundler.require *Rails.groups

module Fbt5
  class Application < Rails::Application
    config.middleware.use I18n::JS::Middleware

  end
end
