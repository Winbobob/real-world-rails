# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController do
  controller do
    include RateLimitHeaders

    def show
      head 200
    end
  end

  before do
    routes.draw { get 'show' => 'anonymous#show' }
  end

  describe 'rate limiting' do
    context 'throttling is off' do
      before do
        request.env['rack.attack.throttle_data'] = nil
      end

      it 'does not apply rate limiting' 

    end

    context 'throttling is on' do
      let(:start_time) { DateTime.new(2017, 1, 1, 12, 0, 0).utc }

      before do
        request.env['rack.attack.throttle_data'] = { 'throttle_authenticated_api' => { limit: 100, count: 20, period: 10 } }
        travel_to start_time do
          get 'show'
        end
      end

      it 'applies rate limiting limit header' 


      it 'applies rate limiting remaining header' 


      it 'applies rate limiting reset header' 

    end
  end
end

