require 'spec_helper'

describe Gitlab::ImportExport::AvatarRestorer do
  include UploadHelpers

  let(:shared) { project.import_export_shared }
  let(:project) { create(:project) }

  before do
    allow_any_instance_of(described_class).to receive(:avatar_export_file)
                                                .and_return(uploaded_image_temp_path)
  end

  after do
    project.remove_avatar!
  end

  it 'restores a project avatar' 


  it 'saves the avatar into the project' 

end

