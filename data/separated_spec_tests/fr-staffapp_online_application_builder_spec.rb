# coding: utf-8

require 'rails_helper'

describe OnlineApplicationBuilder do

  let(:current_time) { Time.zone.now }
  let(:submission) { attributes_for :public_app_submission }

  describe '#build' do
    subject(:build_submission) { described_class.new(submission).build }

    it 'returns non persisted OnlineApplication' 


    describe 'it adds a reference number' do
      subject(:reference) { build_submission.reference }

      it { is_expected.not_to be_nil }
    end
  end
end

