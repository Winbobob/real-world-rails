# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::ScopedSettings do
  let(:object)         { Fabricate(:user) }
  let(:scoped_setting) { described_class.new(object) }
  let(:val)            { 'whatever' }
  let(:methods)        { %i(auto_play_gif default_sensitive unfollow_modal boost_modal delete_modal reduce_motion system_font_ui noindex theme) }

  describe '.initialize' do
    it 'sets @object' 

  end

  describe '#method_missing' do
    it 'sets scoped_setting.method_name = val' 

  end

  describe '#[]= and #[]' do
    it 'sets [key] = val' 

  end
end

