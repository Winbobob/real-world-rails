require 'spec_helper'

describe APIv2::Auth::Authenticator do
  Authenticator = APIv2::Auth::Authenticator

  let(:token) { create(:api_token) }
  let(:tonce) { time_to_milliseconds }

  let(:endpoint) { stub('endpoint', options: {route_options: {scopes: ['identity']}})}
  let(:request) { stub('request', request_method: 'GET', path_info: '/', env: {'api.endpoint' => endpoint}) }
  let(:payload) { "GET|/api/|access_key=#{token.access_key}&foo=bar&hello=world&tonce=#{tonce}" }

  let(:params) do
    Hashie::Mash.new({
      "access_key" => token.access_key,
      "tonce"      => tonce,
      "foo"        => "bar",
      "hello"      => "world",
      "route_info" => Grape::Route.new,
      "signature"  => APIv2::Auth::Utils.hmac_signature(token.secret_key, payload)
    })
  end

  subject { Authenticator.new(request, params) }

  its(:authenticate!)          { should == token }
  its(:token)                  { should == token }
  its(:canonical_verb)         { should == 'GET' }
  its(:canonical_uri)          { should == '/' }
  its(:canonical_query)        { should == "access_key=#{token.access_key}&foo=bar&hello=world&tonce=#{tonce}" }

  it "should not be authentic without access key" 


  it "should not be authentic without signature" 


  it "should not be authentic without tonce" 


  it "should return false on unmatched signature" 


  it "should be invalid if tonce is not within 30s" 


  it "should not be authentic on repeated tonce" 


  it "should not be authentic for invalid token" 


  it "should be authentic if associated member is disabled" 


  it "should not be authentic if api access is disabled" 


  it "should not be authentic if token is expired" 


  it "should not be authentic if token is soft deleted" 

end

