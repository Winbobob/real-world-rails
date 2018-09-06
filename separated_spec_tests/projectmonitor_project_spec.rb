require 'spec_helper'

describe 'Project', :type => :request do
  describe '/validate_build_info' do
    let!(:project) { create(:project,
                            ci_build_identifier: 'twitter-for-dogs'
    ) }

    around do |example|
      stub_request(:get, 'http://www.example.com/job/twitter-for-dogs/rssAll')
        .to_return(body: File.new('spec/fixtures/jenkins_atom_examples/invalid_xml.atom'), status: 200)
      stub_request(:get, 'http://www.example.com/cc.xml')
        .to_return(body: File.new('spec/fixtures/jenkins_atom_examples/invalid_xml.atom'), status: 200)

      VCR.turned_off { example.run }
    end

    it 'returns log entry' 


    it 'does not duplicate projects when validating a persisted project' 


    it 'does not create a project when validating an unpersisted project' 

  end

  describe '/validate_tracker_project' do
    it 'returns validation status' 

  end
end

