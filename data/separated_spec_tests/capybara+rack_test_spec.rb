# frozen_string_literal: true

require 'spec_helper'

module TestSessions
  RackTest = Capybara::Session.new(:rack_test, TestApp)
end

skipped_tests = %i[
  js
  modals
  screenshot
  frames
  windows
  send_keys
  server
  hover
  about_scheme
  download
  css
]
Capybara::SpecHelper.run_specs TestSessions::RackTest, 'RackTest', capybara_skip: skipped_tests do |example|
  case example.metadata[:full_description]
  when /has_css\? should support case insensitive :class and :id options/
    pending "Nokogiri doesn't support case insensitive CSS attribute matchers"
  end
end

RSpec.describe Capybara::Session do # rubocop:disable RSpec/MultipleDescribes
  context 'with rack test driver' do
    before do
      @session = TestSessions::RackTest
    end

    describe '#driver' do
      it 'should be a rack test driver' 

    end

    describe '#mode' do
      it 'should remember the mode' 

    end

    describe '#click_link' do
      after do
        @session.driver.options[:respect_data_method] = false
      end

      it 'should use data-method if option is true' 


      it 'should not use data-method if option is false' 


      it "should use data-method if available even if it's capitalized" 

    end

    describe '#fill_in' do
      it 'should warn that :fill_options are not supported' 

    end

    describe '#attach_file' do
      context 'with multipart form' do
        it 'should submit an empty form-data section if no file is submitted' 

      end

      it 'should not submit an obsolete mime type' 

    end

    describe '#click' do
      context 'on a label' do
        it 'should toggle the associated checkbox' 


        it 'should toggle the associated radio' 

      end
    end

    describe '#text' do
      it 'should return original text content for textareas' 

    end

    describe '#style' do
      it 'should raise an error' 

    end
  end
end

RSpec.describe Capybara::RackTest::Driver do
  before do
    @driver = TestSessions::RackTest.driver
  end

  describe ':headers option' do
    it 'should always set headers' 


    it 'should keep headers on link clicks' 


    it 'should keep headers on form submit' 


    it 'should keep headers on redirects' 

  end

  describe ':follow_redirects option' do
    it 'defaults to following redirects' 


    it 'is possible to not follow redirects' 

  end

  describe ':redirect_limit option' do
    context 'with default redirect limit' do
      before do
        @driver = Capybara::RackTest::Driver.new(TestApp)
      end

      it 'should follow 5 redirects' 


      it 'should not follow more than 6 redirects' 

    end

    context 'with 21 redirect limit' do
      before do
        @driver = Capybara::RackTest::Driver.new(TestApp, redirect_limit: 21)
      end

      it 'should follow 21 redirects' 


      it 'should not follow more than 21 redirects' 

    end
  end
end

module CSSHandlerIncludeTester
  def dont_extend_css_handler
    raise 'should never be called'
  end
end

RSpec.describe Capybara::RackTest::CSSHandlers do
  include CSSHandlerIncludeTester

  it 'should not be extended by global includes' 

end

