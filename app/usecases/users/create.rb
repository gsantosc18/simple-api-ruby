# frozen_string_literal: true

require './app/adapters/repositories/user_repository'
require './app/model/user'

module Users
  class UserNotFoundError < StandardError; end

  class Create
    def initialize(params, user_repository: UserRepository)
      @params = params
      @user_repository = user_repository
    end

    def call
      @user_repository.create(name: @params['name'])
    end
  end

  class List
    def initialize(user_repository: UserRepository)
      @user_repository = user_repository
    end

    def call
      @user_repository.all
    end
  end

  class Delete
    def initialize(id, user_repository: UserRepository)
      @id = id
      @user_repository = user_repository
    end

    def call
      user = @user_repository.find_by(id: @id)
      raise UserNotFoundError, "User not found. id=#{@id}" unless user
      @user_repository.destroy_by(id: @id)
    end
  end

  class Put
    def initialize(id: Integer, user: User, user_repository: UserRepository)
      @id = id
      @params = params
      @user_repository = user_repository
    end

    def call
      user = @user_repository.first(@id)
      user.update(name: user.name)
    end
  end
end
