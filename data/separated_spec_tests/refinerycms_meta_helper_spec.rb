require 'spec_helper'

module Refinery
  describe MetaHelper, type: :helper do

    describe '#canonical_id' do
      context "when page doesn't exist" do
        let(:page) { nil }

        it 'returns nothing' 

      end

      context 'when page exists' do
        let(:page) { Page.new slug: 'testing' }

        it "returns the page's canonical slug with '-page' appended" 

      end
    end

    describe '#view_template_class' do
      context "when page doesn't exist" do
        let(:page) { nil }

        it 'returns nothing' 

      end

      context 'when page exists' do
        let(:page) { Page.new slug: 'testing', view_template: 'home' }

        it "returns the page's view_template with 'template-' prepended" 

      end
    end

  end
end

