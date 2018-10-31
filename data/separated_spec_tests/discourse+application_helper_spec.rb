require 'rails_helper'

describe ApplicationHelper do

  describe "preload_script" do
    it "provides brotli links to brotli cdn" 


    context "with s3 CDN" do
      before do
        global_setting :s3_bucket, 'test_bucket'
        global_setting :s3_region, 'ap-australia'
        global_setting :s3_access_key_id, '123'
        global_setting :s3_secret_access_key, '123'
        global_setting :s3_cdn_url, 'https://s3cdn.com'
        set_env "COMPRESS_BROTLI", "1"
      end

      after do
        ActionController::Base.config.relative_url_root = nil
      end

      it "deals correctly with subfolder" 


      it "returns magic brotli mangling for brotli requests" 


      it "gives s3 cdn if asset host is not set" 


      it "gives s3 cdn even if asset host is set" 

    end
  end

  describe "escape_unicode" do
    it "encodes tags" 

    it "survives junk text" 

  end

  describe "mobile_view?" do
    context "enable_mobile_theme is true" do
      before do
        SiteSetting.enable_mobile_theme = true
      end

      it "is true if mobile_view is '1' in the session" 


      it "is false if mobile_view is '0' in the session" 


      context "mobile_view is not set" do
        it "is false if user agent is not mobile" 


        it "is true for iPhone" 


        it "is true for Android Samsung Galaxy" 


        it "is true for Android Google Nexus 5X" 


        it "is false for iPad" 


        it "is false for Nexus 10 tablet" 


        it "is false for Nexus 7 tablet" 

      end
    end

    context "enable_mobile_theme is false" do
      before do
        SiteSetting.enable_mobile_theme = false
      end

      it "is false if mobile_view is '1' in the session" 


      it "is false if mobile_view is '0' in the session" 


      context "mobile_view is not set" do
        it "is false if user agent is not mobile" 


        it "is false for iPhone" 

      end
    end
  end

  describe '#rtl_class' do
    it "returns 'rtl' when the I18n.locale is rtl" 


    it 'returns an empty string when the I18n.locale is not rtl' 

  end

  describe 'gsub_emoji_to_unicode' do
    it "converts all emoji to unicode" 

  end

  describe 'preloaded_json' do
    it 'returns empty JSON if preloaded is empty' 


    it 'escapes and strips invalid unicode and strips in json body' 

  end
end

