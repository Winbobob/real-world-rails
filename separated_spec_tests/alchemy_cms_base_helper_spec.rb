# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe BaseHelper do
    describe "#render_icon" do
      subject { helper.render_icon(:info, options) }

      let(:options) { Hash.new }

      it 'renders a solid fontawesome icon with fixed width' 


      context 'with style set to regular' do
        let(:options) { {style: 'regular'} }

        it 'renders a regular fontawesome icon' 

      end

      context 'with size set to xs' do
        let(:options) { {size: 'xs'} }

        it 'renders a extra small fontawesome icon' 

      end

      context 'with transform option given' do
        let(:options) { {transform: 'flip-horizontal'} }

        it 'renders a transformed fontawesome icon' 

      end

      context 'with class option given' do
        let(:options) { {class: 'disabled'} }

        it 'renders a fontawesome icon with additional css class' 

      end
    end

    describe "#render_message" do
      context "if no argument is passed" do
        it "should render a div with an info icon and the given content" 

      end

      context "if an argument is passed" do
        it "should render the passed argument as the css classname for the icon container" 

      end
    end

    describe '#page_or_find' do
      let(:page) { create(:alchemy_page, :public) }

      context "passing a page_layout string" do
        context "of a not existing page" do
          it "should return nil" 

        end

        context 'of an existing page' do
          it "should return the page object" 

        end
      end

      context "passing a page object" do
        it "should return the given page object" 

      end
    end

    describe '#message_icon_class' do
      subject { helper.message_icon_class(message_type) }

      context 'when `warning`, `warn` or `alert` message type is given' do
        %w(warning warn alert).each do |type|
          let(:message_type) { type }

          it { is_expected.to eq 'exclamation' }
        end
      end

      context 'when `notice` message type is given' do
        let(:message_type) { 'notice' }

        it { is_expected.to eq 'check' }
      end

      context 'when `error` message type is given' do
        let(:message_type) { 'error' }

        it { is_expected.to eq 'bug' }
      end

      context 'when unknown message type is given' do
        let(:message_type) { 'info' }

        it 'returns the given message type as icon name' 

      end
    end
  end
end

