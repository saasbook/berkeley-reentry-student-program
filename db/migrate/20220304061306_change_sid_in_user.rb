class ChangeSidInUser < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :sid, :bigint)
  end
end
