# frozen_string_literal: true

require 'spec_helper'

include Alchemy::ElementsHelper

module Alchemy
  describe 'ElementsBlockHelper' do
    let(:page)    { create(:alchemy_page, :public) }
    let(:element) { create(:alchemy_element, page: page, tag_list: 'foo, bar') }
    let(:expected_wrapper_tag) { "div.#{element.name}##{element_dom_id(element)}" }

    describe '#element_view_for' do
      it "should yield an instance of ElementViewHelper" 


      it "should wrap its output in a DOM element" 


      it "should change the wrapping DOM element according to parameters" 


      it "should include the element's tags in the wrapper DOM element" 


      it "should use the provided tags formatter to format tags" 


      it "should include the contents rendered by the block passed to it" 


      context "when/if preview mode is not active" do
        subject { element_view_for(element) }
        it { is_expected.to have_css expected_wrapper_tag }
        it { is_expected.not_to have_css "#{expected_wrapper_tag}[data-alchemy-element]" }
      end

      context "when/if preview mode is active" do
        before do
          assign(:preview_mode, true)
          assign(:page, page)
        end

        subject { helper.element_view_for(element) }
        it { is_expected.to have_css "#{expected_wrapper_tag}[data-alchemy-element='#{element.id}']" }
      end
    end

    describe '#element_editor_for' do
      it "should yield an instance of ElementEditorHelper" 


      it "should not add any extra elements" 

    end

    describe 'ElementsBlockHelper::ElementViewHelper' do
      let(:scope) { double }
      subject { ElementsBlockHelper::ElementViewHelper.new(scope, element: element) }

      it 'should have a reference to the specified element' 


      describe '#render' do
        it 'should delegate to the render_essence_view_by_name helper' 

      end

      describe '#content' do
        it "should delegate to the element's #content_by_name method" 

      end

      describe '#ingredient' do
        it "should delegate to the element's #ingredient method" 

      end

      describe '#has?' do
        it "should delegate to the element's #has_ingredient? method" 

      end

      describe '#essence' do
        it "should provide the specified content essence" 

      end
    end

    describe 'ElementsBlockHelper::ElementEditorHelper' do
      let(:scope) { double }
      subject { ElementsBlockHelper::ElementEditorHelper.new(scope, element: element) }

      it 'should have a reference to the specified element' 


      describe '#edit' do
        it "should delegate to the render_essence_editor_by_name helper" 

      end
    end
  end
end

