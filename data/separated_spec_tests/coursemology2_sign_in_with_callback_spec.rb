# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: Devise: sign_in with resource', type: :controller do
  class self::TestUser < User
    before_sign_in :before_callback
    after_sign_in :after_callback

    def before_callback
    end

    def after_callback
    end
  end

  controller do
    include Devise::Controllers::SignInOut
  end

  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:user) { self.class::TestUser.new }
    # Set run_callbacks to false to skip Warden callbacks
    subject { controller.sign_in(:user, user, run_callbacks: false) }

    it 'calls #before_sign_in' 


    it 'calls #after_sign_in' 


    context 'when callbacks is not included' do
      before { allow(self.class::TestUser).to receive(:included_modules).and_return([]) }

      it 'does not call #before_sign_in' 


      it 'does not call #after_sign_in' 

    end
  end
end

