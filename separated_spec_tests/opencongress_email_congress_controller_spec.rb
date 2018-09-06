require 'spec_helper'
require 'spec_helpers/email_congress_spec_helper'

RSpec.configure do |c|
  c.include EmailCongressHelper
end

describe EmailCongressController do
  describe 'Known user' do
    before(:each) do
      @user = users(:jdoe)
    end

    it "should bounce for illegitimate recipient" 


    it 'should not be able to send to reps outside their district' 

    	rep on live (as logged in user), I get the response from no_recipient_bounce"
	    other_state = State::ABBREVIATIONS.values.reject{ |st| st == @user.state }.first
	    other_sen = Person.sen.where(:state => other_state).first
	    rcpt_addr = EmailCongress.email_address_for_person(other_sen)
	    seed = incoming_seed({
	      "To" => rcpt_addr,
	      "ToFull" => [ { "Email" => rcpt_addr, "Name" => "" } ]
	    })
	    get :confirm, :confirmation_code => seed.confirmation_code
	    assert_redirected_to @controller.url_for(:action => :complete_profile,
	                                             :confirmation_code => seed.confirmation_code)
	    get :complete_profile, :confirmation_code => seed.confirmation_code
	    assert_response :success
    end

    it "should send a confirmation link when user emails myreps@" 


    it "successful_confirmation" 


    it 'should send a warning email to people that haven\'t supplied a plaintext verion' 



    it 'should send a warning email to people that try to email someone that\'s uncontactable' 


    it 'should send a warning email to people that email myreps when one of their reps is uncontactable' 

  end

  describe 'New users' do
    it 'no_bounce_for_illegitimate_recipients_for_new_user' 


    it 'should not bounce when new user emails myreps@' 


    it "New seed should redirect to /complete_profile" 

  end
end

