describe Locomotive::Concerns::RedirectToMainHostController do

  before(:all) do
    class MyController < ActionController::Base
      include Locomotive::Concerns::RedirectToMainHostController
      def root_url(options); end
    end
    Locomotive.config.host = 'station.locomotive.dev'
  end

  after(:all) do
    Object.send :remove_const, :MyController
    Locomotive.config.host = nil
  end

  let(:my_controller)   { MyController.new }
  let(:request)         { ActionDispatch::Request.new({}) }

  before { allow(my_controller).to receive(:request).and_return(request) }

  it 'adds a filter method for redirect_to_main_host' 


  describe '#redirect_to_main_host' do

    let(:host) { nil }

    before { allow(request).to receive(:host).and_return(host) }

    subject { my_controller.send(:redirect_to_main_host) }

    context 'the host in the configuration file is nil' do

      before { allow(Locomotive.config).to receive(:host).and_return(nil) }

      it "doesn't redirect" 


    end

    context 'the host in the configuration file is present' do

      before { allow(Locomotive.config).to receive(:host).and_return('station.locomotive.dev') }

      context 'request to the main host' do

        let(:host) { 'station.locomotive.dev' }

        it "doesn't need to redirect" 


      end

      context 'request to another host' do

        let(:host) { 'locomotive.dev' }

        it 'redirects to the main host' 


        context 'with a port' do

          before { allow(request).to receive(:port).and_return(8080) }

          it 'preserves the port' 


        end

      end

    end

  end

end

