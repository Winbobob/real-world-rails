require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170816102555_cleanup_nonexisting_namespace_pending_delete_projects.rb')

describe CleanupNonexistingNamespacePendingDeleteProjects do
  before do
    # Stub after_save callbacks that will fail when Project has invalid namespace
    allow_any_instance_of(Project).to receive(:ensure_storage_path_exist).and_return(nil)
    allow_any_instance_of(Project).to receive(:update_project_statistics).and_return(nil)
  end

  describe '#up' do
    set(:some_project) { create(:project) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

    it 'only cleans up when namespace does not exist' 


    it 'does nothing when no pending delete projects without namespace found' 

  end
end

