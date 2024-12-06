# frozen_string_literal: true

require './app/usecases/users/create'

class UserController
  def self.create(params)
    Users::Create.new(params).call
  end

  def self.list
    Users::List.new.call
  end

  def self.delete(id)
    Users::Delete.new(id).call
  end
end
