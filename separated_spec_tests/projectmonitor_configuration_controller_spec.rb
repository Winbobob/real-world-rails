require 'spec_helper'

describe ConfigurationController, :type => :controller do
  before { sign_in create(:user) }

  describe '#index' do
    subject { get :show }

    it 'should return the configuration' 

  end

  describe '#create' do
    subject do
      post :create, content: fixture_file_upload('/files/empty_configuration.yml')
    end

    it 'should change the configuration' 

  end

  describe '#edit' do
    let(:tags) { 'nyc' }

    it 'should find all the projects' 


    it 'should find all the aggregate projects' 


    it 'gets a list of all the tags in the system' 

  end
end

