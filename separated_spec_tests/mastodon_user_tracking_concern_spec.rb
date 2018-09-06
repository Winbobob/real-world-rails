# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    include UserTrackingConcern

    def show
      render plain: 'show'
    end
  end

  before do
    routes.draw { get 'show' => 'anonymous#show' }
  end

  describe 'when signed in' do
    let(:user) { Fabricate(:user) }

    it 'does not track when there is a recent sign in' 


    it 'tracks when sign in is nil' 


    it 'tracks when sign in is older than one day' 


    describe 'feed regeneration' do
      before do
        alice = Fabricate(:account)
        bob   = Fabricate(:account)

        user.account.follow!(alice)
        user.account.follow!(bob)

        Fabricate(:status, account: alice, text: 'hello world')
        Fabricate(:status, account: bob, text: 'yes hello')
        Fabricate(:status, account: user.account, text: 'test')

        user.update(last_sign_in_at: 'Tue, 04 Jul 2017 14:45:56 UTC +00:00', current_sign_in_at: 'Wed, 05 Jul 2017 22:10:52 UTC +00:00')

        sign_in user, scope: :user
      end

      it 'sets a regeneration marker while regenerating' 


      it 'sets the regeneration marker to expire' 


      it 'regenerates feed when sign in is older than two weeks' 

    end

    def expect_updated_sign_in_at(user)
      expect(user.reload.current_sign_in_at).to be_within(1.0).of(Time.now.utc)
    end
  end
end

