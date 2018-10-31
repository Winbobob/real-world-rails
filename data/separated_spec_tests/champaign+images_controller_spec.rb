# frozen_string_literal: true

require 'rails_helper'

describe ImagesController do
  let(:page)  { instance_double('Page', valid?: true) }
  let(:image) { double('image', content: 'foo', errors: []) }

  before do
    allow(Page).to receive(:find) { page }
  end

  include_examples 'session authentication'

  describe 'POST #create' do
    before do
      allow(page).to receive_message_chain(:images, :create).and_return(image)
    end

    subject { post :create, params: { page_id: '1', image: { content: 'foo' }, format: :js } }

    it 'authenticates session' 


    it 'finds page' 


    it 'creates image' 


    it 'responds with errors if unsuccessful' 

  end

  describe 'DELETE #destroy' do
    before do
      allow(image).to receive(:destroy)
      allow(page).to receive_message_chain(:images, :find) { image }
    end

    subject { delete :destroy, params: { page_id: '1', id: '2', format: :json } }

    it 'authenticates session' 


    it 'finds page' 


    it 'finds image' 


    it 'destroys image' 

  end
end

