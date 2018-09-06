# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  class MyCustomUser
  end

  describe 'AuthAccessors' do
    describe '.user_class' do
      before do
        # prevent memoization
        Alchemy.class_variable_set('@@user_class', nil)
      end

      it "raises error if user_class_name is not a String" 


      after do
        Alchemy.user_class_name = 'DummyUser'
      end
    end

    describe 'defaults' do
      it 'has default value for Alchemy.signup_path' 


      it 'has default value for Alchemy.login_path' 


      it 'has default value for Alchemy.logout_path' 

    end
  end
end

