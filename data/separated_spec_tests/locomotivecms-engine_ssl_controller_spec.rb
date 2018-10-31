describe Locomotive::Concerns::SslController do

  before(:all) do
    class MyController < ActionController::Base
      include Locomotive::Concerns::SslController
    end
  end

  after(:all) do
    Object.send :remove_const, :MyController
    Locomotive.config.enable_admin_ssl = false
  end

  let(:my_controller)   { MyController.new }
  let(:request)         { ActionDispatch::Request.new({}) }

  before { allow(my_controller).to receive(:request).and_return(request) }

  it 'adds a filter method for require_ssl' 


  describe '#require_ssl' do

    subject { my_controller.send(:require_ssl) }

    context 'SSL disabled' do

      before { Locomotive.config.enable_admin_ssl = false }

      it "doesn't redirect to SSL" 


    end

    context 'SSL enabled' do

      let(:request_ssl) { false }

      before do
        Locomotive.config.enable_admin_ssl = true
        allow(request).to receive(:ssl?).and_return(request_ssl)
      end

      context 'not a SSL request' do

        it 'redirects to SSL' 


      end

      context 'a SSL request' do

        let(:request_ssl) { true }

        it "doesn't redirect to SSL" 


      end

    end

  end

end

