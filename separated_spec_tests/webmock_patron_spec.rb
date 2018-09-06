# encoding: utf-8

require 'spec_helper'
require 'acceptance/webmock_shared'

unless RUBY_PLATFORM =~ /java/
  require 'acceptance/patron/patron_spec_helper'
  require 'tmpdir'
  require 'fileutils'

  describe "Patron" do
    include PatronSpecHelper

    include_examples "with WebMock"

    describe "when custom functionality is used" do
      before(:each) do
        @sess = Patron::Session.new
        @sess.base_url = "http://www.example.com"
      end

      it "should allow stubbing PATCH request with body" 


      describe "file requests" do

        before(:each) do
          @dir_path = Dir.mktmpdir('webmock-')
          @file_path = File.join(@dir_path, "webmock_temp_test_file")
          FileUtils.rm_rf(@file_path) if File.exist?(@file_path)
        end

        after(:each) do
          FileUtils.rm_rf(@dir_path) if File.exist?(@dir_path)
        end

        it "should work with get_file" 


        it "should raise same error as Patron if file is not readable for get request" 


        it "should work with put_file" 


        it "should work with post_file" 


        it "should raise same error as Patron if file is not readable for post request" 


      end

      describe "handling errors same way as patron" do
        it "should raise error if put request has neither upload_data nor file_name" 

      end

      it "should work with WebDAV copy request" 


      if /^1\.9/ === RUBY_VERSION
        describe "handling encoding same way as patron" do
          around(:each) do |example|
            @encoding = Encoding.default_internal
            Encoding.default_internal = "UTF-8"
            example.run
            Encoding.default_internal = @encoding
          end

          it "should not encode body with default encoding" 


          it "should not encode body to default internal" 

        end
      end
    end
  end
end

