# encoding: utf-8
require 'spec_helper'

describe TimeParser do
  describe 'initialize' do
    context "Chicago time" do
      let(:target_time) { 1454925600 }
      let(:time_str) { "2016-02-08 04:00:00" }
      it "parses with timezone, without and with unreadable timezones" 

    end
    context "UTC" do
      let(:target_time) { 1454814602 }
      let(:time_str) { "2016-02-07 03:10:02" }
      it "parses with UTC timezone and with a place in UTC" 

    end
    context "nil" do
      it "returns nil" 

    end
  end
  describe "timezone_parser" do
    context "new york" do
      let(:timezone_str) { "America/New York" }
      let(:target_timezone) { ActiveSupport::TimeZone["Eastern Time (US & Canada)"] }
      it "returns correctly" 

    end
  end
end

