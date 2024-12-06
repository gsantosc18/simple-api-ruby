# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
  end
end
