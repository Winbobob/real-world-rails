require 'rails_helper'
require 'rate_limiter'

describe RateLimiter do

  let(:user) { Fabricate(:user) }
  let(:rate_limiter) { RateLimiter.new(user, "peppermint-butler", 2, 60) }

  context 'disabled' do
    before do
      rate_limiter.performed!
      rate_limiter.performed!
    end

    it "should be disabled" 


    it "returns true for can_perform?" 


    it "doesn't raise an error on performed!" 


  end

  context 'enabled' do
    before do
      RateLimiter.enable
      rate_limiter.clear!
    end

    after do
      RateLimiter.disable
    end

    context 'global rate limiter' do

      it 'can operate in global mode' 


    end

    context 'handles readonly' do
      before do
        $redis.without_namespace.slaveof '10.0.0.1', '99999'
      end

      after do
        $redis.without_namespace.slaveof 'no', 'one'
      end

      it 'does not explode' 

    end

    context 'never done' do
      it "should perform right away" 


      it "performs without an error" 

    end

    context "remaining" do
      it "updates correctly" 

    end

    context 'max is less than or equal to zero' do

      it 'should raise the right error' 

    end

    context "multiple calls" do
      before do
        rate_limiter.performed!
        rate_limiter.performed!
      end

      it "returns false for can_perform when the limit has been hit" 


      it "raises an error the third time called" 


      context "as an admin/moderator" do
        it "returns true for can_perform if the user is an admin" 


        it "doesn't raise an error when an admin performs the task" 


        it "returns true for can_perform if the user is a mod" 


        it "doesn't raise an error when a moderator performs the task" 

      end

      context "rollback!" do
        before do
          rate_limiter.rollback!
        end

        it "returns true for can_perform since there is now room" 


        it "raises no error now that there is room" 

      end

    end
  end

end

