# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    include SignatureVerification

    def success
      head 200
    end

    def alternative_success
      head 200
    end
  end

  before do
    routes.draw { match via: [:get, :post], 'success' => 'anonymous#success' }
  end

  context 'without signature header' do
    before do
      get :success
    end

    describe '#signed_request?' do
      it 'returns false' 

    end

    describe '#signed_request_account' do
      it 'returns nil' 

    end
  end

  context 'with signature header' do
    let!(:author) { Fabricate(:account) }

    context 'without body' do
      before do
        get :success

        fake_request = Request.new(:get, request.url)
        fake_request.on_behalf_of(author)

        request.headers.merge!(fake_request.headers)
      end

      describe '#signed_request?' do
        it 'returns true' 

      end

      describe '#signed_request_account' do
        it 'returns an account' 


        it 'returns nil when path does not match' 


        it 'returns nil when method does not match' 

      end
    end

    context 'with request older than a day' do
      before do
        get :success

        fake_request = Request.new(:get, request.url)
        fake_request.add_headers({ 'Date' => 2.days.ago.utc.httpdate })
        fake_request.on_behalf_of(author)

        request.headers.merge!(fake_request.headers)
      end

      describe '#signed_request?' do
        it 'returns true' 

      end

      describe '#signed_request_account' do
        it 'returns nil' 

      end
    end

    context 'with body' do
      before do
        post :success, body: 'Hello world'

        fake_request = Request.new(:post, request.url, body: 'Hello world')
        fake_request.on_behalf_of(author)

        request.headers.merge!(fake_request.headers)
      end

      describe '#signed_request?' do
        it 'returns true' 

      end

      describe '#signed_request_account' do
        it 'returns an account' 


        it 'returns nil when path does not match' 


        it 'returns nil when method does not match' 


        it 'returns nil when body has been tampered' 

      end
    end
  end
end

