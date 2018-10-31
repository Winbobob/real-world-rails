require 'spec_helper'

describe CreateReleaseService do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:tag_name) { project.repository.tag_names.first }
  let(:description) { 'Awesome release!' }
  let(:service) { described_class.new(project, user) }

  it 'creates a new release' 


  it 'raises an error if the tag does not exist' 


  context 'there already exists a release on a tag' do
    before do
      service.execute(tag_name, description)
    end

    it 'raises an error and does not update the release' 

  end
end

