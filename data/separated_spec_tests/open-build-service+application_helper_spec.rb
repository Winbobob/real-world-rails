require 'rails_helper'

RSpec.describe Webui::ObsFactory::ApplicationHelper, type: :helper do
  describe '#distribution_tests_link' do
    let(:distribution) { ObsFactory::Distribution.new(create(:project, name: 'openSUSE:Leap:15.1')) }

    it 'creates a url to the openqa distribution tests' 


    context 'when a version is provided' do
      it 'adds the version to the version to the url' 

    end
  end
end

