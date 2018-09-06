# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::ContentsHelper do
  let(:element) { build_stubbed(:alchemy_element, name: 'article') }
  let(:content) { mock_model('Content', essence_partial_name: 'essence_text') }

  describe 'render_content_name' do
    let(:content) do
      mock_model 'Content',
        name: 'intro',
        definition: {name: 'intro', type: 'EssenceText'},
        name_for_label: 'Intro',
        has_validations?: false
    end
    subject { helper.render_content_name(content) }

    it "returns the content name" 


    context 'if content is nil' do
      let(:content) { nil }

      it "returns nil" 

    end

    context 'with missing definition' do
      before { expect(content).to receive(:definition).and_return({}) }

      it "renders a warning with tooltip" 

    end

    context 'with validations' do
      before { expect(content).to receive(:has_validations?).and_return(true) }

      it "show a validation indicator" 

    end
  end
end

