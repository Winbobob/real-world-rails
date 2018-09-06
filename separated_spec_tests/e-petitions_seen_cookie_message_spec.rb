require 'rails_helper'

RSpec.describe 'seen_cookie_message cookie', type: :request, show_exceptions: true do
  let(:the_past) { Time.utc(2014, 7, 2, 10, 9, 9) }
  let(:cookies) { response.header["Set-Cookie"].split("\n") }

  subject do
    cookies.find{ |c| c =~ /^seen_cookie_message/ }
  end

  before do
    get "/"
  end

  around do |example|
    travel_to(the_past) { example.run }
  end

  it "should set the secure option" 


  it "should set the httponly option" 


  it "should set the expiry to 1 year from now" 

end

