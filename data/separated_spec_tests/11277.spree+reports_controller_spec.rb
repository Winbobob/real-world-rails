require 'spec_helper'

describe Spree::Admin::ReportsController, type: :controller do
  stub_authorization!

  describe 'ReportsController.available_reports' do
    it 'contains sales_total' 


    it 'has the proper sales total report description' 

  end

  describe 'ReportsController.add_available_report!' do
    context 'when adding the report name' do
      it 'contains the report' 

    end
  end

  describe 'GET index' do
    it 'is ok' 

  end

  it 'responds to model_class as Spree::AdminReportsController' 


  after do
    Spree::Admin::ReportsController.available_reports.delete_if do |key, _value|
      key != :sales_total
    end
  end
end

