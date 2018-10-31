require 'spec_helper'

describe UpdateReleaseService do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:tag_name) { project.repository.tag_names.first }
  let(:description) { 'Awesome release!' }
  let(:new_description) { 'The best release!' }
  let(:service) { described_class.new(project, user) }

  context 'with an existing release' do
    let(:create_service) { CreateReleaseService.new(project, user) }

    before do
      create_service.execute(tag_name, description)
    end

    it 'successfully updates an existing release' 

  end

  it 'raises an error if the tag does not exist' 


  it 'raises an error if the release does not exist' 

end

