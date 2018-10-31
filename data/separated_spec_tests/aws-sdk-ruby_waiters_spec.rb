require_relative '../spec_helper'

module Aws
  module Waiters
    describe 'Waiters' do

      dir = File.expand_path('../../fixtures/waiters', __FILE__)
      WaiterTest = ApiHelper.sample_service(
        api: Json.load_file("#{dir}/api.json"),
        waiters: Json.load_file("#{dir}/waiters.json")
      )

      let(:client) {
        WaiterTest::Client.new(stub_responses: true)
      }

      describe 'unknown waiters' do

        it 'raises an error when attempting to wait for an unknown state' 


        it 'lists available waiters in the error message' 


      end

      describe 'Client#wait_until' do

        it 'can match an path value' 


        it 'yields the waiter to the client #wait_until block' 


        it 'returns true when :success thrown' 


        it 'returns the thrown value when :success thrown' 


        it 'triggers callbacks before sending and before waiting' 


        it 'returns when successful' 


        it 'returns the client response' 


        it 'raises an error when failed' 


        it 'raises a max attempts after the configured attempt count' 


        it 'sleeps between attempts' 


        it 'catches :failure from before attempt callbacks' 


        it 'catches :failure from before wait callbacks' 


        it 'catches :success from before attempt callbacks' 


        it 'catches :success from before wait callbacks' 


        describe 'matching on expectd errors' do

          it 'succeedes when an expected error is encountered' 


          it 'fails when an expected error is not encountered' 


        end

        describe 'errors' do

          it 'does not trap errors raised during reqest' 


          it 'raises response errors' 


        end
      end
    end
  end
end

