require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170502101023_cleanup_namespaceless_pending_delete_projects.rb')

describe CleanupNamespacelessPendingDeleteProjects, :migration, schema: 20180222043024 do
  before do
    # Stub after_save callbacks that will fail when Project has no namespace
    allow_any_instance_of(Project).to receive(:ensure_storage_path_exists).and_return(nil)
    allow_any_instance_of(Project).to receive(:update_project_statistics).and_return(nil)
  end

  describe '#up' do
    it 'only cleans up pending delete projects' 


    it 'does nothing when no pending delete projects without namespace found' 

  end
end

