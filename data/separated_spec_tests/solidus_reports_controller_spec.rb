# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::ReportsController, type: :controller do
  stub_authorization!

  describe 'ReportsController.available_reports' do
    it 'should contain sales_total' 


    it 'should have the proper sales total report description' 

  end

  describe 'ReportsController.add_available_report!' do
    context 'when adding the report name' do
      it 'should contain the report' 

    end
  end

  describe 'GET sales_total' do
    let!(:order_complete_start_of_month) { create(:completed_order_with_totals) }
    let!(:order_complete_mid_month) { create(:completed_order_with_totals) }
    let!(:order_non_complete) { create(:order, completed_at: nil) }

    before do
      # can't set completed_at during factory creation
      order_complete_start_of_month.completed_at = Time.current.beginning_of_month + 1.minute
      order_complete_start_of_month.save!

      order_complete_mid_month.completed_at = Time.current.beginning_of_month + 15.days
      order_complete_mid_month.save!
    end

    subject { get :sales_total, params: params }

    shared_examples 'sales total report' do
      it 'should respond with success' 


      it 'should set search to be a ransack search' 


      it 'should set orders correctly for date parameters' 


      it 'does not include non-complete orders' 


      it 'should correctly set the totals hash' 

    end

    context 'when no dates are specified' do
      let(:params) { {} }

      it_behaves_like 'sales total report' do
        let(:expected_returned_orders) { [order_complete_mid_month, order_complete_start_of_month] }
        let(:expected_totals) {
          {
            'USD' => {
              item_total: Money.new(2000, 'USD'),
              adjustment_total: Money.new(0, 'USD'),
              sales_total: Money.new(22_000, 'USD')
            }
          }
        }
      end
    end

    context 'when params has a completed_at_gt' do
      let(:params) { { q: { completed_at_gt: Time.current.beginning_of_month + 1.day } } }

      it_behaves_like 'sales total report' do
        let(:expected_returned_orders) { [order_complete_mid_month] }
        let(:expected_totals) {
          {
            'USD' => {
              item_total: Money.new(1000, 'USD'),
              adjustment_total: Money.new(0, 'USD'),
              sales_total: Money.new(11_000, 'USD')
            }
          }
        }
      end
    end

    context 'when params has a compeleted_at_lt' do
      let(:params) { { q: { completed_at_lt: Time.current.beginning_of_month } } }

      it_behaves_like 'sales total report' do
        let(:expected_returned_orders) { [order_complete_start_of_month] }
        let(:expected_totals) {
          {
            'USD' => {
              item_total: Money.new(1000, 'USD'),
              adjustment_total: Money.new(0, 'USD'),
              sales_total: Money.new(11_000, 'USD')
            }
          }
        }
      end
    end
  end

  describe 'GET index' do
    it 'should be ok' 

  end

  after(:each) do
    Spree::Admin::ReportsController.available_reports.delete_if do |key, _value|
      key != :sales_total
    end
  end
end

