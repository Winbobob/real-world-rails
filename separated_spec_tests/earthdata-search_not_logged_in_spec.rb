require 'spec_helper'

describe 'User not logged in', reset: false do
  before :each do
    Capybara.reset_sessions!
    logout
  end

  context 'when a user views the data configure page without being logged in' do
    before :each do
      load_page 'data/configure', project: ['C179003030-ORNL_DAAC']
    end

    it "sends them to log in first" 

  end

  context 'when a user views the data status page without being logged in' do
    before :each do
      visit '/data/status'
    end

    it "sends them to log in first" 

  end

  context 'when a user views the contact information page without being logged in' do
    before :each do
      visit '/contact_info'
    end

    it "sends them to log in first" 

  end

end

