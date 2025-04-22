# frozen_string_literal: true

class Course < ApplicationRecord
  validates :code, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :units, presence: true

  def self.to_csv
    require "csv"
    attributes = %w{id code title description units semester schedule ccn location available created_at updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |course|
        csv << attributes.map { |attr| course.send(attr) }
      end
    end
  end
end
