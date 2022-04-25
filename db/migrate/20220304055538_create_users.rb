# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :sid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :is_student
      t.boolean :is_admin
      t.boolean :is_staff

      t.timestamps
    end
    add_index :users, :sid, unique: true
    add_index :users, :email, unique: true
  end
end
