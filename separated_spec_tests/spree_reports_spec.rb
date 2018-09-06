require 'spec_helper'

describe 'Reports', type: :feature do
  stub_authorization!

  context 'visiting the admin reports page' do
    it 'has the right content' 

  end

  context 'searching the admin reports page' do
    before do
      order = create(:order)
      order.update_columns(adjustment_total: 100)
      order.completed_at = Time.current
      order.save!

      order = create(:order)
      order.update_columns(adjustment_total: 200)
      order.completed_at = Time.current
      order.save!

      # incomplete order
      order = create(:order)
      order.update_columns(adjustment_total: 50)
      order.save!

      order = create(:order)
      order.update_columns(adjustment_total: 200)
      order.completed_at = 3.years.ago
      order.created_at = 3.years.ago
      order.save!

      order = create(:order)
      order.update_columns(adjustment_total: 200)
      order.completed_at = 3.years.from_now
      order.created_at = 3.years.from_now
      order.save!
    end

    it 'allows me to search for reports' 

  end
end

