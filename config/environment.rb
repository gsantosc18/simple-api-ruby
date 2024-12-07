# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'active_support/deprecation'
require 'active_support/all'

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems
