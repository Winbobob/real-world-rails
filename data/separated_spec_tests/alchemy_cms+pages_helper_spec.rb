# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::PagesHelper do
  describe '#preview_sizes_for_select' do
    it "returns a options string of preview screen sizes for select tag" 

  end

  describe '#page_layout_label' do
    let(:page) { build(:alchemy_page) }

    subject { helper.page_layout_label(page) }

    context 'when page is not yet persisted' do
      it 'displays text only' 

    end

    context 'when page is persisted' do
      before { page.save! }

      context 'with page layout existing' do
        it 'displays text only' 

      end

      context 'with page layout definition missing' do
        before do
          expect(page).to receive(:definition).and_return([])
        end

        it 'displays icon with warning and tooltip' 

      end
    end
  end
end

