# frozen_string_literal: true

require 'spec_helper'

describe ConferencesController do
  let(:conference) { create(:conference, splashpage: create(:splashpage, public: true), venue: create(:venue)) }
  let!(:cfp) { create(:cfp, program: conference.program) }
  let(:room) { create(:room, venue: conference.venue) }

  describe 'GET #index' do
    it 'Response code is 200' 

  end

  describe 'GET #show' do
    context 'conference made public' do
      it 'assigns the requested conference to conference' 


      it 'renders the show template' 

    end

    context 'accessing conference via custom domain' do
      before do
        conference.update_attribute(:custom_domain, 'lvh.me')
        @request.host = 'lvh.me'
      end

      it 'assigns correct conference' 

    end
  end

  describe 'OPTIONS #index' do
    it 'Response code is 200' 

  end

end

