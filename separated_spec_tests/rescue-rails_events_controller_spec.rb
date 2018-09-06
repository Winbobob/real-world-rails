require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'is successful' 

  end

  describe 'GET #past' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'GET #show' do
    let(:event) { create(:event) }

    it 'is successful' 

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

    let(:event) { create(:event) }

    it 'is successful' 

  end

  describe 'POST #create' do
    include_context 'signed in admin'

    it 'is successful' 

  end

  describe 'POST #delete' do
    include_context 'signed in admin'

    let(:event) { create(:event) }

    it 'is successful' 

  end
end

