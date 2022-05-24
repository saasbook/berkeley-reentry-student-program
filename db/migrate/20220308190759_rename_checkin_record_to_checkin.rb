# frozen_string_literal: true

class RenameCheckinRecordToCheckin < ActiveRecord::Migration[6.1]
  def change
    rename_table :checkin_records, :checkins
  end
end
