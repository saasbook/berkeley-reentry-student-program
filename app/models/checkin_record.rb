class CheckinRecord < ApplicationRecord
  belongs_to :student, class_name: :User, foreign_key: :user_id
end
