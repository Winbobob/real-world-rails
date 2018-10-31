require 'spec_helper'

describe ApplicationHelper do
  describe '#display_url' do
    it 'returns the domain portion of a given url' 

  end

  context 'logo retrieval' do
    let(:organization) { Organization.new }
    let(:logo) { double }

    describe '#find_logo' do
      it "returns an organization's attached logo if it exists" 


      it "returns an organizations's image_url if no attached logo exists" 

    end

    describe '#find_logo?' do
      it 'returns true if an organization has a logo attachment' 


      it 'returns true if an organization has an image_url defined' 


      it 'returns false if neither logo nor image_url are present' 

    end
  end

  describe '#twitter_url' do
    it 'returns twitter url for given non nil handle' 


    it 'returns nil when nil is given' 

  end
end

