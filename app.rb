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

get '/users' do
  content_type :json
  UserController.list.to_json
end

delete '/users/:id' do |id|
  begin
    UserController.delete(id.to_i)
    status 200
  rescue Users::UserNotFoundError => e
    status 404
    content_type :json
    { error: e.message }.to_json
  end
end
