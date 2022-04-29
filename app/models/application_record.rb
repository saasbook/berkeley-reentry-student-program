# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # get the 20 records in RECORDS sorted by SORTED_ORDER start from index 20*n
  def self.get_20_records(records, sort_order, n)
    from_index = n >= 0 ? 20 * n : 0
    recs = records.all.order(time: :desc)[from_index, 20] || []
    recs
  end
end
