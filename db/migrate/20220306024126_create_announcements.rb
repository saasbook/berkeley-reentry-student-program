# frozen_string_literal: true

class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.date :issued_date
      t.references :admin, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
