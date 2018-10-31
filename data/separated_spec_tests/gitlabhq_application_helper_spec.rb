# coding: utf-8
require 'spec_helper'

describe ApplicationHelper do
  describe 'current_controller?' do
    it 'returns true when controller matches argument' 


    it 'returns false when controller does not match argument' 


    it 'takes any number of arguments' 


    def stub_controller_name(value)
      allow(helper.controller).to receive(:controller_name).and_return(value)
    end
  end

  describe 'current_action?' do
    it 'returns true when action matches' 


    it 'returns false when action does not match' 


    it 'takes any number of arguments' 


    def stub_action_name(value)
      allow(helper).to receive(:action_name).and_return(value)
    end
  end

  describe 'simple_sanitize' do
    let(:a_tag) { '<a href="#">Foo</a>' }

    it 'allows the a tag' 


    it 'allows the span tag' 


    it 'disallows other tags' 

  end

  describe 'time_ago_with_tooltip' do
    def element(*arguments)
      Time.zone = 'UTC'
      @time = Time.zone.parse('2015-07-02 08:23')
      element = helper.time_ago_with_tooltip(@time, *arguments)

      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    it 'returns a time element' 


    it 'includes the date string' 


    it 'has a datetime attribute' 


    it 'has a formatted title attribute' 


    it 'includes a default js-timeago class' 


    it 'accepts a custom html_class' 


    it 'accepts a custom tooltip placement' 


    it 'converts to Time' 


    it 'add class for the short format' 

  end

  describe '#active_when' do
    it { expect(helper.active_when(true)).to eq('active') }
    it { expect(helper.active_when(false)).to eq(nil) }
  end

  describe '#support_url' do
    context 'when alternate support url is specified' do
      let(:alternate_url) { 'http://company.example.com/getting-help' }

      before do
        stub_application_setting(help_page_support_url: alternate_url)
      end

      it 'returns the alternate support url' 

    end

    context 'when alternate support url is not specified' do
      it 'builds the support url from the promo_url' 

    end
  end

  describe '#locale_path' do
    it 'returns the locale path with an `_`' 

  end

  describe '#autocomplete_data_sources' do
    let(:project) { create(:project) }
    let(:noteable_type) { Issue }
    it 'returns paths for autocomplete_sources_controller' 

  end
end

