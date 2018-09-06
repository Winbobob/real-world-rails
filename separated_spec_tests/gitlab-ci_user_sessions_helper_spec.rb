require 'spec_helper'

describe UserSessionsHelper do
  describe 'generate_oauth_hmac' do
    let (:salt) { 'a' }
    let (:salt2) { 'b' }
    let (:return_to) { 'b' }

    it 'should return null if return_to is also null' 


    it 'should return not null if return_to is also not null' 


    it 'should return different hmacs for different salts' 

  end

  describe 'generate_oauth_state' do
    let (:return_to) { 'b' }

    it 'should return null if return_to is also null' 


    it 'should return two different states for same return_to' 

  end

  describe 'get_ouath_state_return_to' do
    let (:return_to) { 'a' }
    let (:state) { generate_oauth_state(return_to) }

    it 'should return return_to' 

  end

  describe 'is_oauth_state_valid?' do
    let (:return_to) { 'a' }
    let (:state) { generate_oauth_state(return_to) }
    let (:forged) { "forged#{state}" }
    let (:invalid) { 'aa' }
    let (:invalid2) { 'aa:bb' }
    let (:invalid3) { 'aa:bb:' }

    it 'should validate oauth state' 


    it 'should not validate forged state' 


    it 'should not validate invalid state' 

  end
end

