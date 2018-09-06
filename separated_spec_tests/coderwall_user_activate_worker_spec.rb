require 'vcr_helper'
require 'sidekiq/testing'

Sidekiq::Testing.inline!

RSpec.describe UserActivateWorker do
  let(:worker) { UserActivateWorker.new }

  describe 'queueing' do
    it 'pushes jobs to the correct queue' 

  end

  describe('#perform') do
    context 'when invalid user' do
      let(:user_id) { 1 }

      it { expect { worker.perform(user_id) }.not_to raise_error }
    end

    context 'when pending user' do
      let(:user) { Fabricate(:pending_user) }

      it 'should activate user' 


      it 'should send welcome mail' 


      it 'should create refresh job' 


    end

    context 'when activate user' do
      let(:user) { Fabricate(:user) }

      it 'should do nothing' 

    end
  end
end

