require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'is successful' 

  end

  describe 'GET #index, with upcoming scope' do
    let(:future_event){ create(:event, :in_the_future) }
    let(:past_event){ create(:event, :in_the_past) }

    it "shows future events" 

  end

  describe 'GET #index, with past scope' do
    let(:future_event){ create(:event, :in_the_future) }
    let(:past_event){ create(:event, :in_the_past) }

    it "shows future events" 

  end

  describe 'GET #show' do
    let(:event) { create(:event) }

    it 'is successful with valid id param' 


    it 'is unsuccessful with invalid id param' 

  end

  describe 'GET #new' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'GET #edit' do
    include_context 'signed in admin'

    let(:event) { create(:event) }

    it 'is successful' 

  end

  describe 'PUT #update' do
    include_context 'signed in admin'

    let(:event) { create(:event, :in_the_future) }

    it 'is successful' 

  end

  describe 'POST #create' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'POST #delete' do
    include_context 'signed in admin'

    let(:past_event) { create(:event, :in_the_past) }
    let(:future_event) { create(:event, :in_the_future) }

    it 'is successful, and redirects to the appropriate scope' 


    it 'is successful, and redirects to the appropriate scope' 

  end
end

