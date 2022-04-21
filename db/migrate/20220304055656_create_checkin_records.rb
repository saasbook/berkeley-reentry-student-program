# frozen_string_literal: true

class CreateCheckinRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :checkin_records do |t|
      t.datetime :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
