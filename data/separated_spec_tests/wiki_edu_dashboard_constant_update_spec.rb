# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/data_cycle/constant_update"

describe ConstantUpdate do
  describe 'on initialization' do
    before do
      create(:course, start: '2015-03-20', end: '2015-03-31', needs_update: true,
                      flags: { salesforce_id: 'a0f1a9063a1Wyad' })
    end

    it 'calls lots of update routines and resets :needs_update flag on courses' 


    it 'reports logs to sentry even when it errors out' 

  end
end

