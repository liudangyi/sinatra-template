require "sinatra/activerecord/rake"
require 'sinatra/asset_pipeline/task'
require "./config/application"
Sinatra::AssetPipeline::Task.define! Sinatra::Application

desc "Start the server"
task :server do
	Sinatra::Application.run!
end

desc "Start a console to debug"
task :console do
	require "pry"
	pry
end

desc "Run tests"
task :test do
	Dir["test/*.rb"].each {|file| require file }
end

task :c => :console
task :s => :server

desc "Generate nginx_conf file"
task "setup:nginx" do
	File.write("config/nginx.conf", ERB.new(File.read("config/nginx_conf.erb")).result(binding))
end
