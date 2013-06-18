# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['TWITTER_CONSUMER_KEY'] = '4gqWxFBvhLTcxnyxwvHWA'
ENV['TWITTER_CONSUMER_SECRET'] = 'IHTL44CemMPfdfnftjK5s0wI90ClokTgOUR9DeFC48'
ENV['TWITTER_OAUTH_TOKEN'] = '18322967-KQpXXLXgY7KSixoNuCyo5dtniZi6yNz4YxFiy3srl'
ENV['TWITTER_OAUTH_TOKEN_SECRET'] = 'Lmra7uSFu5tnOFdYmoOK3grGrHYcBF58X0P2s7jrA0'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
