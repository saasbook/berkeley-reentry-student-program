class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.date :issued_date
      t.string :title
      t.string :content
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
