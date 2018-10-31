require 'rails_helper'

RSpec.describe DiscourseNarrativeBot::CertificateGenerator do
  let(:user) { Fabricate(:user) }

  describe 'when an invalid date is given' do
    it 'should default to the current date' 

  end

  describe '#logo_group' do
    describe 'when SiteSetting.logo_small_url is blank' do
      before do
        SiteSetting.logo_small_url = ''
      end

      it 'should not try to fetch a image' 

    end
  end
end

