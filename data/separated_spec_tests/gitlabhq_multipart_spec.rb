require 'spec_helper'

require 'tempfile'

describe Gitlab::Middleware::Multipart do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }
  let(:original_filename) { 'filename' }

  it 'opens top-level files' 


  it 'rejects headers signed with the wrong secret' 


  it 'rejects headers signed with the wrong issuer' 


  it 'opens files one level deep' 


  it 'opens files two levels deep' 


  def post_env(rewritten_fields, params, secret, issuer)
    token = JWT.encode({ 'iss' => issuer, 'rewritten_fields' => rewritten_fields }, secret, 'HS256')
    Rack::MockRequest.env_for(
      '/',
      method: 'post',
      params: params,
      described_class::RACK_ENV_KEY => token
    )
  end
end

