# frozen_string_literal: true

class AddProfileToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :major, :string
    add_column :users, :identities, :string
    add_column :users, :pronouns, :string
    add_column :users, :grad_year, :datetime
  end
end
