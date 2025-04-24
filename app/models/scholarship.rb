# frozen_string_literal: true

require "csv"

class Scholarship < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :status_text, presence: true
  validates :application_url, format: { with: URI.regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  def self.to_csv
    attributes = %w[id name description status_text application_url created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |scholarship|
        csv << attributes.map { |attr| scholarship.send(attr) }
      end
    end
  end
end
