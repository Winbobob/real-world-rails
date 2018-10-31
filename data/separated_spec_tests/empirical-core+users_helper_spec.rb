require 'rails_helper'

describe Cms::UsersHelper do
  describe '#format_date' do
    it 'should return the correct format' 

  end

  describe '#completed_by' do
    let(:user) { double(:user, name: "name") }

    it 'should give the correct values' 

  end

  describe '#action_column' do
    context 'when stage is completed' do
      let(:stage) { double(:stage, completed_at: "completed") }

      it 'should return completed' 


    end

    context 'when stage has user trigger' do
      let(:stage) { double(:stage, completed_at: nil, trigger: "user") }

      before do
        allow(helper).to receive(:complete_sales_stage_link) { "link" }
      end

      it 'should return the complete stage sales link' 

    end

    context 'when stage does not have user trigger' do
      let(:stage) { double(:stage, completed_at: nil, trigger: "not user") }

      it 'should give the titlized trigger' 

    end
  end
end

