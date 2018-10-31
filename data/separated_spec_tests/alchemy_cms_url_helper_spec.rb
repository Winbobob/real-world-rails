# frozen_string_literal: true

require 'spec_helper'

include Alchemy::ElementsHelper

module Alchemy
  describe UrlHelper do
    let(:page) { mock_model(Page, urlname: 'testpage', language_code: 'en') }

    before do
      helper.controller.class_eval { include Alchemy::ConfigurationMethods }
    end

    context 'page path helpers' do
      describe "#show_page_path_params" do
        subject(:show_page_path_params) { helper.show_page_path_params(page) }

        context "if prefix_locale? is false" do
          before do
            expect(helper).to receive(:prefix_locale?) { false }
          end

          it "returns a Hash with urlname and no locale parameter" 


          context "with addiitonal parameters" do
            subject(:show_page_path_params) do
              helper.show_page_path_params(page, {query: 'test'})
            end

            it "returns a Hash with urlname, no locale and query parameter" 

          end
        end

        context "if prefix_locale? is false" do
          before do
            expect(helper).to receive(:prefix_locale?) { true }
          end

          it "returns a Hash with urlname and locale parameter" 


          context "with additional parameters" do
            subject(:show_page_path_params) do
              helper.show_page_path_params(page, {query: 'test'})
            end

            it "returns a Hash with urlname, locale and query parameter" 

          end
        end
      end

      describe "#show_alchemy_page_path" do
        context "when prefix_locale? set to true" do
          before do
            expect(helper).to receive(:prefix_locale?) { true }
          end

          it "should return the correct relative path string" 


          it "should return the correct relative path string with additional parameters" 

        end

        context "when prefix_locale? set to false" do
          before do
            expect(helper).to receive(:prefix_locale?) { false }
          end

          it "should return the correct relative path string" 


          it "should return the correct relative path string with additional parameter" 

        end
      end

      describe "#show_alchemy_page_url" do
        context "when prefix_locale? set to true" do
          before do
            expect(helper).to receive(:prefix_locale?) { true }
          end

          it "should return the correct url string" 


          it "should return the correct url string with additional parameters" 

        end

        context "when prefix_locale? set to false" do
          before do
            expect(helper).to receive(:prefix_locale?) { false }
          end

          it "should return the correct url string" 


          it "should return the correct url string with additional parameter" 

        end
      end
    end

    context 'attachment path helpers' do
      let(:attachment) { mock_model(Attachment, urlname: 'test-attachment.pdf') }

      it 'should return the correct relative path to download an attachment' 


      it 'should return the correct url to download an attachment' 

    end

    describe '#full_url_for_element' do
      subject { full_url_for_element(element) }

      let(:element) { build_stubbed(:alchemy_element, name: 'headline', page: page) }
      let(:current_server) { '' }

      it "returns the url to this element" 

    end
  end
end

