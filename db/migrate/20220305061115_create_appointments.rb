# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :location
      t.references :staff, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
