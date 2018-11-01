# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::AnnouncementsHelper do
  describe '#announcements_title' do
    let(:settings_with_default_title) { OpenStruct.new(title: nil) }
    let(:settings_with_given_title) { OpenStruct.new(title: 'The title') }

    before do
      helper.extend(ApplicationFormattersHelper)
    end

    context 'when the title is blank' do
      before do
        helper.instance_variable_set(:@settings, settings_with_default_title)
      end

      it 'returns nil' 

    end

    context 'when the title is set' do
      before do
        helper.instance_variable_set(:@settings, settings_with_given_title)
      end

      it 'returns a string' 

    end
  end
end

