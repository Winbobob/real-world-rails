# encoding: utf-8

require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170313133418_rename_more_reserved_project_names.rb')

# This migration uses multiple threads, and thus different transactions. This
# means data created in this spec may not be visible to some threads. To work
# around this we use the DELETE cleaning strategy.
describe RenameMoreReservedProjectNames, :delete do
  let(:migration) { described_class.new }
  let!(:project) { create(:project) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

  before do
    project.path = 'artifacts'
    project.save!(validate: false)
  end

  describe '#up' do
    context 'when project repository exists' do
      before do
        project.create_repository
      end

      context 'when no exception is raised' do
        it 'renames project with reserved names' 

      end

      context 'when exception is raised during rename' do
        before do
          allow(project).to receive(:rename_repo).and_raise(StandardError)
        end

        it 'captures exception from project rename' 

      end
    end

    context 'when project repository does not exist' do
      it 'does not raise error' 

    end
  end
end

