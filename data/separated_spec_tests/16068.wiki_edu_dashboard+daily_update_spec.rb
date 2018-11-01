# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/data_cycle/daily_update"

describe DailyUpdate do
  before do
    create(:course, start: '2015-03-20', end: 1.month.from_now,
                    flags: { salesforce_id: 'a0f1a9063a1Wyad' })
  end

  describe 'on initialization' do
    it 'calls lots of update routines' 


    it 'reports logs to sentry even when it errors out' 

  end

  context 'when a pid file is present' do
    it 'deletes the pid file for a non-running process' 

  end
end

