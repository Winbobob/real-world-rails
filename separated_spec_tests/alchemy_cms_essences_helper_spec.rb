# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::EssencesHelper do
  include Alchemy::Admin::ElementsHelper

  let(:element) do
    create(:alchemy_element, name: 'article', create_contents_after_create: true)
  end

  describe 'essence rendering' do
    before do
      if element
        element.content_by_name('intro').essence.update(body: 'hello!')
      end
    end

    describe '#render_essence_editor' do
      it "should render an essence editor" 

    end

    describe '#render_essence_editor_by_name' do
      subject { render_essence_editor_by_name(element, content) }

      let(:content) { 'intro' }

      it "renders an essence editor by given name" 


      context 'when element is nil' do
        let(:element) { nil }

        it "displays a warning" 

      end

      context 'when content is not found on element' do
        let(:content) { 'sputz' }

        it "displays a warning" 

      end
    end
  end

  describe '#pages_for_select' do
    let(:contact_form) do
      create(:alchemy_element, name: 'contactform', create_contents_after_create: true)
    end

    let(:page_a) { create(:alchemy_page, :public, name: 'Page A') }
    let(:page_b) { create(:alchemy_page, :public, name: 'Page B') }
    let(:page_c) { create(:alchemy_page, :public, name: 'Page C', parent_id: page_b.id) }

    before do
      # to be shure the ordering is alphabetic
      page_b
      page_a
      helper.session[:alchemy_language_id] = 1
    end

    context "with no arguments given" do
      it "should return options for select with all pages ordered by lft" 


      it "should return options for select with nested page names" 

    end

    context "with pages passed in" do
      before do
        @pages = []
        3.times { @pages << create(:alchemy_page, :public) }
      end

      it "should return options for select with only these pages" 


      it "should not nest the page names" 

    end
  end

  describe '#essence_picture_thumbnail' do
    let(:essence) do
      build_stubbed(:alchemy_essence_picture)
    end

    let(:content) do
      build_stubbed(:alchemy_content, essence: essence)
    end

    before do
      allow(essence).to receive(:content) { content }
    end

    it "should return an image tag with thumbnail url from essence" 


    context 'when given content has no ingredient' do
      before { allow(content).to receive(:ingredient).and_return(nil) }

      it "should return nil" 

    end
  end

  describe "#edit_picture_dialog_size" do
    let(:content) { build_stubbed(:alchemy_content) }

    subject { edit_picture_dialog_size(content) }

    context "with content having setting caption_as_textarea being true and sizes set" do
      before do
        allow(content).to receive(:settings) do
          {
            caption_as_textarea: true,
            sizes: ['100x100', '200x200']
          }
        end

        it { is_expected.to eq("380x320") }
      end
    end

    context "with content having setting caption_as_textarea being true and no sizes set" do
      before do
        allow(content).to receive(:settings) do
          {
            caption_as_textarea: true
          }
        end

        it { is_expected.to eq("380x300") }
      end
    end

    context "with content having setting caption_as_textarea being false and sizes set" do
      before do
        allow(content).to receive(:settings) do
          {
            caption_as_textarea: false,
            sizes: ['100x100', '200x200']
          }
        end

        it { is_expected.to eq("380x290") }
      end
    end

    context "with content having setting caption_as_textarea being false and no sizes set" do
      before do
        allow(content).to receive(:settings) do
          {
            caption_as_textarea: false
          }
        end

        it { is_expected.to eq("380x255") }
      end
    end
  end
end

