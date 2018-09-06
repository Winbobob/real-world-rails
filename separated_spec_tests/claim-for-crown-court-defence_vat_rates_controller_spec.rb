# == Schema Information
#
# Table name: vat_rates
#
#  id               :integer          not null, primary key
#  rate_base_points :integer
#  effective_date   :date
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe VatRatesController, type: :controller do

  before do
    VatRate.delete_all
    create(:vat_rate, effective_date: Date.new(2000, 1, 1), rate_base_points: 1750)
    create(:vat_rate, effective_date: Date.new(2011, 4, 1), rate_base_points: 2000)
  end

  describe 'GET vat' do
    context 'advocate claims' do
      it 'if vat applies, it should return JSON struct with details' 


      it 'if vat applies, it should round the net_amount to two decimal places' 


      it 'if vat does not apply, it should return JSON struct with details and total_inc_vat = net_amount' 


      it 'if vat does not apply, it should round the net_amount to two decimal places and total_inc_vat = net_amount' 

    end

    context 'litigator claims' do
      it 'should add a flat vat amount provided by user and round to two decimal places ' 

    end
  end

end

