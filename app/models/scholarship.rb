# frozen_string_literal: true

class Scholarship < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :status_text, presence: true
  validates :application_url, format: { with: URI.regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
end
