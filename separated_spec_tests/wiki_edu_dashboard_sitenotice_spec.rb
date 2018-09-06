# frozen_string_literal: true

require 'rails_helper'

describe 'sitenotice', type: :feature do
  before :each do
    ENV['sitenotice'] = notice
  end

  context 'set in the environment' do
    let(:notice) { 'NOTICE: The system will go down for maintenance soon.' }

    it 'is displayed if set' 

  end

  context 'not set in the environment' do
    let(:notice) { '' }

    it 'does not display a flash notice' 

  end
end
