require 'rails_helper'

describe ApplicationHelper do
  describe '#icon_tag' do
    it 'returns a Glyphicon icon element' 


    it 'returns a Glyphicon icon element with an addidional class' 


    it 'returns a FontAwesome icon element' 


    it 'returns a FontAwesome icon element' 

  end

  describe '#nav_link' do
    it 'returns a nav link' 


    it 'returns an active nav link' 


    describe 'with block' do
      it 'returns a nav link with menu' 


      it 'returns an active nav link with menu' 


      it 'returns an active nav link with menu when on a child page' 

    end
  end

  describe '#yes_no' do
    it 'returns a label "Yes" if any truthy value is given' 


    it 'returns a label "No" if any falsy value is given' 

  end

  describe '#working' do
    before do
      @agent = agents(:jane_website_agent)
    end

    it 'returns a label "Disabled" if a given agent is disabled' 


    it 'returns a label "Missing Gems" if a given agent has dependencies missing' 


    it 'returns a label "Yes" if a given agent is working' 


    it 'returns a label "No" if a given agent is not working' 

  end

  describe '#omniauth_provider_icon' do
    it 'returns a correct icon tag for Twitter' 


    it 'returns a correct icon tag for GitHub' 


    it 'returns a correct icon tag for other services' 

  end

  describe '#highlighted?' do
    it 'understands hl=6-8' 


    it 'understands hl=1,3-4,9' 


    it 'understands hl=8-' 


    it 'understands hl=-2' 


    it 'understands hl=-' 


    it 'is OK with no hl' 

  end
end

