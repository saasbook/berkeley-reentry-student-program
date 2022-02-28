class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
