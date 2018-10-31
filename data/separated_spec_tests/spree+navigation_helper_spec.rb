require 'spec_helper'

describe Spree::Admin::NavigationHelper, type: :helper do
  before do
    # `spree` route helper is not accessible in `type: :helper` hence extending it explicitly
    # https://github.com/rspec/rspec-rails/issues/1626
    helper.extend Spree::TestingSupport::UrlHelpers
  end

  describe '#tab' do
    before do
      allow(helper).to receive(:cannot?).and_return false
    end

    context 'creating an admin tab' do
      it "capitalizes the first letter of each word in the tab's label" 

    end

    it 'accepts options with label and capitalize each word of it' 


    it 'capitalizes words with unicode characters' 


    describe 'selection' do
      context 'when match_path option is not supplied' do
        subject(:tab) { helper.tab(:orders) }

        it 'is selected if the controller matches' 


        it 'is not selected if the controller does not match' 

      end

      context 'when match_path option is supplied' do
        before do
          allow(helper).to receive(:request).and_return(double(ActionDispatch::Request, fullpath: '/admin/orders/edit/1'))
        end

        it 'is selected if the fullpath matches' 


        it 'is selected if the fullpath matches a regular expression' 


        it 'is not selected if the fullpath does not match' 


        it 'is not selected if the fullpath does not match a regular expression' 

      end
    end
  end

  describe '#klass_for' do
    it 'returns correct klass for Spree model' 


    it 'returns correct klass for non-spree model' 


    it 'returns correct namespaced klass for non-spree model' 

  end
end

