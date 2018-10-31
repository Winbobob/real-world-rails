require 'spec_helper'

describe OmniAuth::Strategies::Twitter do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Twitter.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' 


    it 'should have correct site' 


    it 'should have correct authorize url' 

  end

  describe 'info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should returns the nickname' 


    it 'should returns the name' 


    it 'should returns the email' 


    it 'should returns the location' 


    it 'should returns the description' 


    it 'should returns the urls' 

  end

  describe 'image_size option' do
    context 'when user has an image' do
      it 'should return image with size specified' 


      it 'should return bigger image when bigger size specified' 


      it 'should return secure image with size specified' 


      it 'should return normal image by default' 

    end
  end

  describe 'skip_info option' do
    context 'when skip info option is enabled' do
      it 'should not include raw_info in extras hash' 

    end
  end

  describe 'request_phase' do
    context 'with no request params set and x_auth_access_type specified' do
      before do
        allow(subject).to receive(:request).and_return(
          double('Request', {:params => {'x_auth_access_type' => 'read'}})
        )
        allow(subject).to receive(:old_request_phase).and_return(:whatever)
      end

      it 'should not break' 

    end

    context "with no request params set and use_authorize options provided" do
      before do
        @options = { :use_authorize => true }
        allow(subject).to receive(:request) do
          double('Request', {:params => {} })
        end
        allow(subject).to receive(:old_request_phase) { :whatever }
      end

      it "should switch authorize_path from authenticate to authorize" 

    end

    context 'with a specified callback_url in the params' do
      before do
        params = { 'callback_url' => 'http://foo.dev/auth/twitter/foobar' }
        allow(subject).to receive(:request) do
          double('Request', :params => params)
        end
        allow(subject).to receive(:session) do
          double('Session', :[] => { 'callback_url' => params['callback_url'] })
        end
        allow(subject).to receive(:old_request_phase) { :whatever }
      end

      it 'should use the callback_url' 


      it 'should return the correct callback_path' 

    end

    context 'with no callback_url set' do
      before do
        allow(subject).to receive(:request) do
          double('Request', :params => {})
        end
        allow(subject).to receive(:session) do
          double('Session', :[] => {})
        end
        allow(subject).to receive(:old_request_phase) { :whatever }
        allow(subject).to receive(:old_callback_url).and_return(:old_callback)
      end

      it 'callback_url should return nil' 


      it 'should return the default callback_path value' 

    end

    context "with no request params set and force_login specified" do
      before do
        allow(subject).to receive(:request) do
          double('Request', {:params => { 'force_login' => true } })
        end
        allow(subject).to receive(:old_request_phase) { :whatever }
      end

      it "should change add force_login=true to authorize_params" 

    end
  end
end

private

def raw_info_hash
  {
    'screen_name' => 'foo',
    'name' => 'Foo Bar',
    'email' => 'foo@example.com',
    'location' => 'India',
    'description' => 'Developer',
    'url' => 'example.com/foobar'
  }
end

