# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'scholarsphere:searches_truncate' do
  let(:backup_folder) { 'backups_test' }
  let(:backup_dir) { Rails.root.join(backup_folder) }
  let(:task) { Rails.root.join('lib', 'tasks', 'scholarsphere', 'searches.rake') }

  # set up the rake environment
  before do
    ScholarSphere::Application.config.backup_directory = backup_dir
    load_rake_environment [task]
    Dir.mkdir(backup_dir)
  end

  after do
    FileUtils.rm_rf(backup_dir)
  end

  describe 'truncate searches', unless: travis? do
    let(:entries) { Dir.new(backup_dir).entries }

    before do
      Search.create(query_params: { search_field: 'all_fields', q: 'test', controller: 'catalog', action: 'index' })
      Search.create(query_params: { search_field: 'all_fields', q: 'test2', controller: 'catalog', action: 'index' })
      Search.create(query_params: { search_field: 'all_fields', q: 'test3', controller: 'catalog', action: 'index' })
    end
    it 'includes all users' 

  end
end

