describe Locomotive::Concerns::SiteDispatcherController do

  before(:all) do
    class MyController < ActionController::Base
      include Locomotive::Concerns::SiteDispatcherController
      include Locomotive::Engine.routes.url_helpers # Required for loading engine routes
    end
  end

  after(:all) { Object.send :remove_const, :MyController }

  let(:my_controller) { MyController.new }

  context 'inheriting from the site dispatcher' do

    it 'adds a helper method for current site' 


  end

  describe '#require_site' do

    context 'when there is a current site' do

      before { expect(my_controller).to receive(:current_site).and_return(true) }

      it 'returns true' 


    end

  end

  describe '#render_no_site_error' do

    render_views

    controller(Locomotive::BaseController) do
      include Locomotive::Concerns::SiteDispatcherController
      include Locomotive::Engine.routes.url_helpers
      helper Locomotive::ErrorsHelper
      def test_render_no_site
        render_no_site_error
      end
    end

    before do
      routes.draw { get 'test_render_no_site' => 'locomotive/base#test_render_no_site' }
    end

    it 'redirects to the list of sites page' 


  end

end

