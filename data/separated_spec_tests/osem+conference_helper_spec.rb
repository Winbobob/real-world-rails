# frozen_string_literal: true

require 'spec_helper'

describe ConferenceHelper, type: :helper do
  let!(:conference) { create(:conference) }
  let!(:contact) { create(:contact, conference: conference) }

  describe '#one_call_open' do
    it 'is falsey if neither call is open' 


    it 'is truthy if call_for_papers is open' 


    it 'is truthy if call_for_tracks is open' 


    it 'is falsey if both calls are open' 

  end

  describe '#sponsorship_mailto' do
    it 'constructs a mailto URL' 


    it 'points to the conference sponsor address' 


    it 'includes a conference identifier' 

  end
end

