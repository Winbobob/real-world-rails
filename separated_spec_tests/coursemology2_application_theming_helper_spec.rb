# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationThemingHelper, type: :helper do
  module ApplicationThemingHelper
    include RenderWithinLayoutHelper
  end

  describe '#page_class' do
    subject { helper.page_class }

    context 'when it has never been called before' do
      it 'returns the page class' 

    end

    context 'when it has been called before' do
      before { helper.page_class }
      it { is_expected.to be_blank }
    end

    describe 'nested layouts' do
      let(:views_directory) do
        path = Pathname.new("#{__dir__}/../fixtures/helpers/application_theming_helper")
        path.realpath
      end

      before { controller.prepend_view_path(views_directory) }
      subject { render template: 'page_class_nested_inside', layout: 'layouts/page_class' }

      it 'does not label the root container with the page class' 


      it 'does not label the nested layout container with the page class' 


      it 'labels the deepest-nested container with the page class' 

    end
  end
end

