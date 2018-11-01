require 'rake_helper'

describe 'rake gitlab:storage:*' do
  before do
    Rake.application.rake_require 'tasks/gitlab/storage'

    stub_warn_user_is_not_gitlab
  end

  shared_examples "rake listing entities" do |entity_name, storage_type|
    context 'limiting to 2' do
      before do
        stub_env('LIMIT' => 2)
      end

      it "lists 2 out of 3 #{storage_type.downcase} #{entity_name}" 

    end

    context "without any #{storage_type.downcase} #{entity_name.singularize}" do
      it 'displays message for empty results' 

    end
  end

  shared_examples "rake entities summary" do |entity_name, storage_type|
    context "with existing 3 #{storage_type.downcase} #{entity_name}" do
      it "reports 3 #{storage_type.downcase} #{entity_name}" 

    end

    context "without any #{storage_type.downcase} #{entity_name.singularize}" do
      it 'displays message for empty results' 

    end
  end

  describe 'gitlab:storage:migrate_to_hashed' do
    let(:task) { 'gitlab:storage:migrate_to_hashed' }

    context '0 legacy projects' do
      it 'does nothing' 

    end

    context '3 legacy projects' do
      let(:projects) { create_list(:project, 3, :legacy_storage) }

      context 'in batches of 1' do
        before do
          stub_env('BATCH' => 1)
        end

        it 'enqueues one StorageMigratorWorker per project' 

      end

      context 'in batches of 2' do
        before do
          stub_env('BATCH' => 2)
        end

        it 'enqueues one StorageMigratorWorker per 2 projects' 

      end
    end

    context 'with same id in range' do
      it 'displays message when project cant be found' 


      it 'displays a message when project exists but its already migrated' 


      it 'enqueues migration when project can be found' 

    end
  end

  describe 'gitlab:storage:legacy_projects' do
    it_behaves_like 'rake entities summary', 'projects', 'Legacy' do
      let(:task) { 'gitlab:storage:legacy_projects' }
      let(:create_collection) { create_list(:project, 3, :legacy_storage) }
    end
  end

  describe 'gitlab:storage:list_legacy_projects' do
    it_behaves_like 'rake listing entities', 'projects', 'Legacy' do
      let(:task) { 'gitlab:storage:list_legacy_projects' }
      let(:create_collection) { create_list(:project, 3, :legacy_storage) }
    end
  end

  describe 'gitlab:storage:hashed_projects' do
    it_behaves_like 'rake entities summary', 'projects', 'Hashed' do
      let(:task) { 'gitlab:storage:hashed_projects' }
      let(:create_collection) { create_list(:project, 3, storage_version: 1) }
    end
  end

  describe 'gitlab:storage:list_hashed_projects' do
    it_behaves_like 'rake listing entities', 'projects', 'Hashed' do
      let(:task) { 'gitlab:storage:list_hashed_projects' }
      let(:create_collection) { create_list(:project, 3, storage_version: 1) }
    end
  end

  describe 'gitlab:storage:legacy_attachments' do
    it_behaves_like 'rake entities summary', 'attachments', 'Legacy' do
      let(:task) { 'gitlab:storage:legacy_attachments' }
      let(:project) { create(:project, storage_version: 1) }
      let(:create_collection) { create_list(:upload, 3, model: project) }
    end
  end

  describe 'gitlab:storage:list_legacy_attachments' do
    it_behaves_like 'rake listing entities', 'attachments', 'Legacy' do
      let(:task) { 'gitlab:storage:list_legacy_attachments' }
      let(:project) { create(:project, storage_version: 1) }
      let(:create_collection) { create_list(:upload, 3, model: project) }
    end
  end

  describe 'gitlab:storage:hashed_attachments' do
    it_behaves_like 'rake entities summary', 'attachments', 'Hashed' do
      let(:task) { 'gitlab:storage:hashed_attachments' }
      let(:project) { create(:project) }
      let(:create_collection) { create_list(:upload, 3, model: project) }
    end
  end

  describe 'gitlab:storage:list_hashed_attachments' do
    it_behaves_like 'rake listing entities', 'attachments', 'Hashed' do
      let(:task) { 'gitlab:storage:list_hashed_attachments' }
      let(:project) { create(:project) }
      let(:create_collection) { create_list(:upload, 3, model: project) }
    end
  end
end

