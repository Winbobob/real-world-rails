# frozen_string_literal: true

require 'rails_helper'

describe RedirectToWebAccessFailure do
  def call_failure(env_params = {})
    env = {
      'REQUEST_URI' => 'http://test.host/',
      'HTTP_HOST' => 'test.host',
      'REQUEST_METHOD' => 'GET',
      'warden.options' => { scope: :user },
      'rack.session' => {},
      'action_dispatch.request.formats' => Array(env_params.delete('formats') || Mime::HTML),
      'rack.input' => '',
      'warden' => OpenStruct.new(message: nil)
    }.merge!(env_params)

    @response = RedirectToWebAccessFailure.call(env).to_a
    @request  = ActionDispatch::Request.new(env)
  end
  describe 'when http_auth? is false' do
    it 'does not set flash' 

  end
end

