require 'spec_helper'

describe Gitlab::RequestForgeryProtection, :allow_forgery_protection do
  let(:csrf_token) { SecureRandom.base64(ActionController::RequestForgeryProtection::AUTHENTICITY_TOKEN_LENGTH) }
  let(:env) do
    {
      'rack.input' => '',
      'rack.session' => {
        _csrf_token: csrf_token
      }
    }
  end

  describe '.call' do
    context 'when the request method is GET' do
      before do
        env['REQUEST_METHOD'] = 'GET'
      end

      it 'does not raise an exception' 

    end

    context 'when the request method is POST' do
      before do
        env['REQUEST_METHOD'] = 'POST'
      end

      context 'when the CSRF token is valid' do
        before do
          env['HTTP_X_CSRF_TOKEN'] = csrf_token
        end

        it 'does not raise an exception' 

      end

      context 'when the CSRF token is invalid' do
        before do
          env['HTTP_X_CSRF_TOKEN'] = 'foo'
        end

        it 'raises an ActionController::InvalidAuthenticityToken exception' 

      end
    end
  end

  describe '.verified?' do
    context 'when the request method is GET' do
      before do
        env['REQUEST_METHOD'] = 'GET'
      end

      it 'returns true' 

    end

    context 'when the request method is POST' do
      before do
        env['REQUEST_METHOD'] = 'POST'
      end

      context 'when the CSRF token is valid' do
        before do
          env['HTTP_X_CSRF_TOKEN'] = csrf_token
        end

        it 'returns true' 

      end

      context 'when the CSRF token is invalid' do
        before do
          env['HTTP_X_CSRF_TOKEN'] = 'foo'
        end

        it 'returns false' 

      end
    end
  end
end

