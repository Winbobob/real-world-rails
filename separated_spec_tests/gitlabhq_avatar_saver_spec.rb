require 'spec_helper'

describe Gitlab::ImportExport::AvatarSaver do
  let(:shared) { project.import_export_shared }
  let(:export_path) { "#{Dir.tmpdir}/project_tree_saver_spec" }
  let(:project_with_avatar) { create(:project, avatar: fixture_file_upload(Rails.root + "spec/fixtures/dk.png", "image/png")) }
  let(:project) { create(:project) }

  before do
    FileUtils.mkdir_p("#{shared.export_path}/avatar/")
    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)
  end

  after do
    FileUtils.rm_rf("#{shared.export_path}/avatar")
  end

  it 'saves a project avatar' 


  it 'is fine not to have an avatar' 

end

