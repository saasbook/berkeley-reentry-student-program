# frozen_string_literal: true

class Admin < User
  has_many :announcements
end
