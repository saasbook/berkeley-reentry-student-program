# frozen_string_literal: true

require 'rails_helper'
include FactoryBot::Syntax::Methods

RSpec.describe Checkin, type: :model do
  before do
    50.times do
      create :checkin
    end
    @all_sorted_records = Checkin.all.order(time: :desc)
  end

  describe 'get_20_checkin_records' do
    it 'n less than 1 should get the first 20 records in Checkin' do
      n = -1
      records_from_method = Checkin.get_20_checkin_records(n)
      expect(records_from_method).to eq @all_sorted_records[0, 20]
    end

    it 'if 20*(n + 1) is greater than the total number of checkin records,
    the method should get records indexed at 20*n to (Checkin.all.size - 1)' do
      n = @all_sorted_records.size / 20
      records_from_method = Checkin.get_20_checkin_records(n)
      expect(records_from_method).to eq @all_sorted_records[20 * n, 20]
    end

    it 'if 20 * n is greater than the total number of checkin records,
    the method should return an empty array' do
      n = @all_sorted_records.size / 20 + 1
      records_from_method = Checkin.get_20_checkin_records(n)
      expect(records_from_method).to eq []
    end

    it 'if 20 * n is equal to the total number of checkin records,
    the method should return an empty array' do
      n = 3
      Checkin.delete_all
      (20 * n).times do
        create :checkin
      end
      records_from_method = Checkin.get_20_checkin_records(n)
      expect(records_from_method).to eq []
    end
  end
end
