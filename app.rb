# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
require './app/adapters/controllers/user_controller'

Dotenv.load

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH') }

post '/users' do 
  data = JSON.parse request.body.read
  content_type :json
  { result: UserController.create(data) }.to_json
end
