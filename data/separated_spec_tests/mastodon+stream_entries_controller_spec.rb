require 'rails_helper'

RSpec.describe StreamEntriesController, type: :controller do
  render_views

  shared_examples 'before_action' do |route|
    context 'when account is not suspended and stream_entry is available' do
      it 'assigns instance variables' 


      it 'sets Link headers' 

    end

    context 'when account is suspended' do
      it 'returns http status 410' 

    end

    context 'when activity is nil' do
      it 'raises ActiveRecord::RecordNotFound' 

    end

    context 'when it is hidden and it is not permitted' do
      it 'raises ActiveRecord::RecordNotFound' 

    end
  end

  describe 'GET #show' do
    include_examples 'before_action', :show

    it 'redirects to status page' 


    it 'returns http success with Atom' 

  end

  describe 'GET #embed' do
    include_examples 'before_action', :embed

    it 'redirects to new embed page' 

  end
end

