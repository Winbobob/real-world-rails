# AirCasting - Share your Air!
# Copyright (C) 2011-2012 HabitatMap, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# You can contact the authors by email at <info@habitatmap.org>

require 'spec_helper'
require './lib/session_builder'

describe SessionBuilder do
  let(:session_data) { { :some => :data, :notes => :note_data, :tag_list => :denormalized_tags, :streams => {:some_stream => {:some => :data}} } }
  let(:session) { stub("session", :id => :session_id) }
  let(:user) { stub("user") }
  let(:photos) { stub("photos") }

  subject { SessionBuilder.new(session_data, photos, user) }

  before do
    ::Stream = stub("Stream") unless Module.const_defined?(:Stream)
    ::Session = stub("Session") unless Module.const_defined?(:Session)
  end

  describe "#build!" do
    before { Session.should_receive(:transaction).and_yield }

    it "should build all the parts" 

  end

  describe "#build_session!" do
    it "should process the data" 

  end

  describe ".prepare_notes" do
    it "should match the photos" 

  end

  describe '.normalize_tags' do
    it 'should replace spaces and commas with commas as tag delimiters' 

  end

  describe '#build_local_start_and_end_time' do
    let(:start_time_iso8601) { "2012-07-17T07:37:37+02:00" }
    let(:end_time_iso8601) { "2012-07-17T07:37:37+02:00" }
    let(:start_time) { DateTime.iso8601 start_time_iso8601 }
    let(:end_time) { DateTime.iso8601 end_time_iso8601 }

    let(:session_data) do
      { :start_time => start_time_iso8601,
        :end_time => end_time_iso8601,
        :some => :data,
        :notes => :note_data,
        :tag_list => :denormalized_tags,
        :streams => {:some_stream => {:some => :data}} }
    end

    it 'adds timezone offset to start_time and end_time and saves it as a local time' 


  end
end

