# frozen_string_literal: true

require 'rails_helper'

describe InstanceHelper do
  describe 'site_title' do
    around do |example|
      site_title = Setting.site_title
      example.run
      Setting.site_title = site_title
    end

    it 'Uses the Setting.site_title value when it exists' 

  end

  describe 'site_hostname' do
    around(:each) do |example|
      before = Rails.configuration.x.local_domain
      example.run
      Rails.configuration.x.local_domain = before
    end

    it 'returns the local domain value' 

  end
end

