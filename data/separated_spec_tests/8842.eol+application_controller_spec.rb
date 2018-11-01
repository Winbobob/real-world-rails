require "spec_helper"

describe ApplicationController do

  # Ideally these test cases should be covered by feature tests but since coverage is poor
  # unit testing is helpful to document expected behaviours of application controller methods.

  before(:all) do
    Language.gen_if_not_exists(:label => 'English')
    @taxon_name          = "<i>italic</i> foo & bar"
    @taxon_name_with_amp = "<i>italic</i> foo &amp; bar"
    @taxon_name_no_tags  = "italic foo & bar"
    @taxon_name_no_html  = "&lt;i&gt;italic&lt;/i&gt; foo &amp; bar"
  end

  it 'should have hh' 


  it "should define controller action scope for translations" 


  it "should define generic parameters for translations" 


  it "should define default meta data values" 


  it "should define default open graph tag values" 


  it "should define default tweet data values" 


  it "should store a copy of the original unmodified request params" 


  describe '#logged_in?' do
    it 'should return user_id key value from session' 

  end

  describe '#referred_url' do
    it 'should return request referrer' 
    it 'should return return_to key value from session' 

  end

  describe '#redirect_back_or_default' do
    # Weird to get :redirect_back_or_default as it is not intended to be a route but we can since it is
    # a public method and we need the response from the request process for testing the redirected_to
    it 'should not redirect to login, register or logout pages when user is logged in' 

    it 'should remove query string from URI if query string includes oauth_provider parameter' 

    it 'should not redirect to bad URIs' 

    it 'should choose session return to first' 

    it 'should redirect to root url when no other url is available' 

    it 'should only redirect back to http protocols' 

  end

  describe '#access_denied' do
    # Weird to get :access_denied as its not intended to be route but we can since it is a
    # public method and we need response from request process for testing redirected_to
    it 'should redirect to referrer' 

  end

  describe '#redirect_if_already_logged_in' do
    it 'redirects to current user when no url is avaliable' 

    it 'redirects to url'do
      session[:user_id] = User.gen.id
      url = 'http://test.host/return'
      session[:return_to] = url
      get :redirect_if_already_logged_in , {return_to: url}
      expect(response).to redirect_to(url)
    end
  end
end


