require "sinatra"
require "sinatra/activerecord"
require "sinatra/asset_pipeline"
if Sinatra::Application.development?
  require 'sinatra/reloader'
  require "better_errors"
  require 'pry'
end

CONFIG = HashWithIndifferentAccess.new YAML::load_file("config/config.yml")
APP_NAME = CONFIG["app"]
APP_ROOT = File.expand_path("#{__dir__}/../")

$:.unshift APP_ROOT
I18n.enforce_available_locales = false
set :database, CONFIG["database"]
set :port, 3000
set :views, "#{APP_ROOT}/views"
set :sessions, key: "#{APP_NAME}.session"
set :session_secret, CONFIG["session_secret"]
register Sinatra::AssetPipeline

configure :development do
  register Sinatra::Reloader
  use BetterErrors::Middleware
  BetterErrors.application_root = APP_ROOT
end

require "config/models"
require "config/controllers"
