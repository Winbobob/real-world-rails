require 'spec_helper'

describe ApplicationHelper do
  describe 'active_link' do
    context 'without a class' do
      it 'returns the link active if it ought to be' 

    end
    context 'match controller true' do
      let(:request) { double('request', url: new_bike_url) }
      before { allow(helper).to receive(:request).and_return(request) }
      it 'returns the link active if it is a bikes page' 

    end
    context 'current with a class' do
      it 'returns the link active if it ought to be' 

    end
    context 'organization_invitation' do
      it 'returns link, active if it ought to be' 

    end
  end

  describe 'current_page_skeleton' do
    before { allow(view).to receive(:controller_namespace) { controller_namespace } }
    let(:controller_namespace) { nil }
    describe 'landing_pages controller' do
      before { allow(view).to receive(:controller_name) { 'landing_pages' } }
      context 'show (organization landing page)' do
        it 'returns nil' 

      end
      %w(for_law_enfocement for_schools).each do |action|
        context action do
          it 'returns nil' 

        end
      end
    end
    describe 'bikes controller' do
      before { allow(view).to receive(:controller_name) { 'bikes' } }
      %w(new create).each do |action|
        context action do
          it 'returns nil' 

        end
      end
      %w(edit update).each do |action|
        context action do
          it 'returns edit_bike_skeleton' 

        end
      end
    end
    describe 'registrations controller' do
      before { allow(view).to receive(:controller_name) { 'registrations' } }
      %w(new).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'info controller' do
      before { allow(view).to receive(:controller_name) { 'info' } }
      %w(about protect_your_bike where serials image_resources resources dev_and_design).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
      context 'support_the_index' do
        it 'returns nil' 

      end
      %w(terms vendor_terms privacy).each do |action|
        context action do
          it 'returns nil' 

        end
      end
    end
    describe 'news controller' do
      before { allow(view).to receive(:controller_name) { 'news' } }
      %w(index show).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'payments controller' do
      before { allow(view).to receive(:controller_name) { 'payments' } }
      %w(new create).each do |action|
        context action do
          it 'returns nil' 

        end
      end
    end
    describe 'feedbacks controller' do
      before { allow(view).to receive(:controller_name) { 'feedbacks' } }
      %w(index).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'manufacturers controller' do
      before { allow(view).to receive(:controller_name) { 'manufacturers' } }
      %w(index).each do |action|
        context action do
          it 'returns nil' 

        end
      end
    end
    describe 'welcome controller' do
      before { allow(view).to receive(:controller_name) { 'welcome' } }
      %w(goodbye).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'organizations controller' do
      before { allow(view).to receive(:controller_name) { 'organizations' } }
      %w(new lightspeed_integration).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'organized subrouting' do
      let(:controller_namespace) { 'organized' }
      context 'manage' do
        before { allow(view).to receive(:controller_name) { 'manage' } }
        it 'returns organized for index' 

      end
      context 'bikes' do
        before { allow(view).to receive(:controller_name) { 'bikes' } }
        it 'returns organized for index' 

      end
      context 'users' do
        before { allow(view).to receive(:controller_name) { 'users' } }
        it 'returns organized for index' 

      end
    end
    describe 'stolen controller' do
      before { allow(view).to receive(:controller_name) { 'stolen' } }
      %w(index).each do |action|
        context action do
          it 'returns nil' 

        end
      end
    end
    describe 'users controller' do
      before { allow(view).to receive(:controller_name) { 'users' } }
      %w(request_password_reset).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
    describe 'errors controller' do
      before { allow(view).to receive(:controller_name) { 'errors' } }
      %w(bad_request not_found unprocessable_entity server_error unauthorized).each do |action|
        context action do
          it 'returns content_skeleton' 

        end
      end
    end
  end

  describe 'body_class' do
    context 'organized_skeleton' do
      it 'returns organized-body' 

    end
    context 'landing_page controller' do
      before { allow(view).to receive(:controller_name) { 'landing_pages' } }
      it 'returns organized-body' 

    end
    context 'bikes controller' do
      before { allow(view).to receive(:controller_name) { 'bikes' } }
      before { allow(view).to receive(:controller_namespace) { nil } }
      it 'returns nil' 

    end
  end

  describe 'content_page_type' do
    context 'info controller' do
      it 'returns info active_page' 

    end
    context 'news controller' do
      it 'returns news index' 

    end
    context 'bikes controller' do
      let(:request) { double('request', url: new_bike_url) }
      before { allow(helper).to receive(:request).and_return(request) }
      it 'returns nil for non-info pages' 

    end
  end

  describe 'content_nav_class' do
    it 'returns active if the section is the active_section' 

  end

  describe 'listicle_html' do
    it 'returns the html formatted as we want' 

  end
end

