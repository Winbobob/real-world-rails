# frozen_string_literal: true

require 'rails_helper'

describe 'error pages' do
  # These steps are necessary to actually load the error pages in rspec.
  # See http://stackoverflow.com/questions/9008520
  before do
    method = Rails.application.method(:env_config)
    expect(Rails.application).to receive(:env_config).with(no_args) do
      method.call.merge(
        'action_dispatch.show_exceptions' => true,
        'action_dispatch.show_detailed_exceptions' => false
      )
    end
  end

  describe 'for non-existent courses' do
    it 'describes the 404 problem' 

  end

  describe 'for non-existent campaigns' do
    it 'describes the 404 problem' 

  end

  describe 'for server errors' do
    it 'says there was a server error' 

  end

  describe 'for incorrect passcode' do
    it 'describes the passcode problem' 

  end
end

