# frozen_string_literal: true

# Transaction
class Transaction
  attr_accessor :type, :value

  def initialize(type, value)
    @type = type
    @value = value
  end
end
