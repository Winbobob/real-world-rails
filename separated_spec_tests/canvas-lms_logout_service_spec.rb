#
# Copyright (C) 2014 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

require 'nokogiri'

describe LtiApiController, type: :request do
  before :once do
    user_with_pseudonym(:username => 'parajsa', :password => 'password1', :active_user => true)
    course_with_student(:active_all => true, :user => @user)
    @tool = @course.context_external_tools.create(:shared_secret => 'test_secret', :consumer_key => 'test_key', :name => 'logout service test tool', :domain => 'example.com')
    @tool.url = 'https://example.edu/tool-launch-url'
    @tool.course_navigation = {
        :enabled => "true"
    }
    @tool.custom_fields = {
        "sub_logout_service_url" => "$Canvas.logoutService.url"
    }
    @tool.save!
  end

  def api_path(token = nil, callback = nil)
    token ||= Lti::LogoutService.create_token(@tool, @pseudonym)
    callback ||= 'http://logout.notify.example.com'
    "/api/lti/v1/logout_service/#{token}?#{{callback: callback}.to_query}"
  end

  def make_call(opts = {})
    opts['path'] ||= api_path
    opts['key'] ||= @tool.consumer_key
    opts['secret'] ||= @tool.shared_secret
    consumer = OAuth::Consumer.new(opts['key'], opts['secret'], :site => "http://www.example.com", :signature_method => "HMAC-SHA1")
    req = consumer.create_signed_request(:post, opts['path'], nil, :scheme => 'header', :timestamp => opts['timestamp'], :nonce => opts['nonce'])
    req.body = opts['body'] if opts['body']
    post "http://www.example.com#{req.path}",
         params: req.body,
         headers: { "CONTENT_TYPE" => opts['content-type'], "HTTP_AUTHORIZATION" => req['Authorization'] }
  end

  it "should generate a logout service URL with token" 


  it "should reject an invalid secret" 


  it "should reject an invalid token" 


  it "should reject an expired token" 


  it "should register callbacks" 


  it "should reject reused tokens" 


  it "should call registered callbacks when the user logs out" 

end

