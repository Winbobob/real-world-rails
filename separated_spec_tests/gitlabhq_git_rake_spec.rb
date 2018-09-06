require 'rake_helper'

describe 'gitlab:git rake tasks' do
  before(:all) do
    @default_storage_hash = Gitlab.config.repositories.storages.default.to_h
  end

  before do
    Rake.application.rake_require 'tasks/gitlab/git'
    storages = { 'default' => Gitlab::GitalyClient::StorageSettings.new(@default_storage_hash.merge('path' => 'tmp/tests/default_storage')) }

    FileUtils.mkdir_p(Settings.absolute('tmp/tests/default_storage/@hashed/1/2/test.git'))
    allow(Gitlab.config.repositories).to receive(:storages).and_return(storages)
    allow_any_instance_of(String).to receive(:color) { |string, _color| string }

    stub_warn_user_is_not_gitlab
  end

  after do
    FileUtils.rm_rf(Settings.absolute('tmp/tests/default_storage'))
  end

  describe 'fsck' do
    it 'outputs the integrity check for a repo' 


    it 'errors out about config.lock issues' 


    it 'errors out about ref lock issues' 

  end
end

