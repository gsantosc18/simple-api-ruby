# frozen_string_literal: true

require './app/adapters/repositories/user_repository'
require './app/model/user'

module Users
  class Create
    def initialize(params, user_repository: UserRepository)
      @params = params
      @user_repository = user_repository
    end

    def call
      @user_repository.create(name: @params['name'])
    end
  end
end
