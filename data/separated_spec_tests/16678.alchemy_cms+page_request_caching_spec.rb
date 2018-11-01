# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Page request caching' do
  let!(:page) { create(:alchemy_page, :public) }

  context "when caching is disabled in app" do
    before do
      Rails.application.config.action_controller.perform_caching = false
    end

    it "sets no-cache header" 

  end

  context "when caching is enabled in app" do
    before do
      Rails.application.config.action_controller.perform_caching = true
    end

    context "and page should be cached" do
      before do
        allow_any_instance_of(Alchemy::Page).to receive(:cache_page?) { true }
      end

      context "and page is not restricted" do
        before do
          allow_any_instance_of(Alchemy::Page).to receive(:restricted) { false }
        end

        context "for page not having expiration time" do
          before do
            allow_any_instance_of(Alchemy::Page).to receive(:expiration_time) { nil }
          end

          it "sets public cache control header" 

        end

        context "for page having expiration time" do
          let!(:public_until) { 10.days.from_now }
          let!(:now) { Time.current }
          let!(:expiration_time) { public_until - now }

          before do
            allow(Time).to receive(:current) { now }
            page.update_column(:public_until, public_until)
          end

          it "sets max-age cache control header" 

        end
      end

      context "when page is restricted" do
        before do
          allow_any_instance_of(Alchemy::Page).to receive(:restricted) { true }
        end

        it "sets private cache control header" 

      end

      it "sets etag header" 


      it "sets last-modified header" 

    end

    context "but page should not be cached" do
      before do
        allow_any_instance_of(Alchemy::Page).to receive(:cache_page?) { false }
      end

      it "sets no-cache header" 


      it "does not set etag header" 


      it "does not set last-modified header" 

    end

    after do
      Rails.application.config.action_controller.perform_caching = false
    end
  end
end

