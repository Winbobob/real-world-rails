# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "When errors occur" do

  def set_consider_all_requests_local(value)
    method = Rails.application.method(:env_config)
    allow(Rails.application).to receive(:env_config).with(no_args) do
      method.call.merge(
        'action_dispatch.show_exceptions' => true,
        'consider_all_requests_local' => value
      )
    end
    @requests_local = Rails.application.config.consider_all_requests_local
    Rails.application.config.consider_all_requests_local = value
  end

  def restore_consider_all_requests_local
    Rails.application.config.consider_all_requests_local = @requests_local
  end

  before(:each) do
    # This should happen automatically before each test but doesn't with these integration
    # tests for some reason.
    ActionMailer::Base.deliveries = []
  end

  after(:each) do
    restore_consider_all_requests_local
  end

  context 'when considering all requests local (by default all in development)' do

    before(:each) { set_consider_all_requests_local(true) }

    it 'should show a full trace for general errors' 


  end

  context 'when not considering all requests local' do

    before(:each) { set_consider_all_requests_local(false) }

    it "should render a 404 for unrouteable URLs using the general/exception_caught template" 


    it "should render a 404 for users or bodies that don't exist using the general/exception_caught
            template" do
      ['/user/wobsnasm', '/body/wobsnasm'].each do |non_existent_url|
        get(non_existent_url)
        expect(response).to render_template('general/exception_caught')
        expect(response.code).to eq("404")
      end
    end

    it 'should render a 404 when given an invalid page parameter' 


    # it 'should handle non utf-8 parameters' do
    #     pending 'until we sanitize non utf-8 parameters for Ruby >= 1.9' do
    #         get ('/%d3')
    #         response.should render_template('general/exception_caught')
    #         response.code.should == '404'
    #         response.body.should match("Sorry, we couldn't find that page")
    #     end
    # end


    it "should render a 500 for general errors using the general/exception_caught template" 


    it 'should render a 500 for json errors' 


    it 'should render a 404 for a non-found xml request' 


    it 'should notify of a general error' 


    it 'should log a general error' 


    it 'should assign the locale for the general/exception_caught template' 


    it "should render a 403 with text body for attempts at directory listing for attachments" 


    it "return a 403 for a JSON PermissionDenied error" 


    it 'returns a 406 when an action does not support the format' 


  end

end

