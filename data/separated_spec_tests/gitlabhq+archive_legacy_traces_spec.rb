require 'spec_helper'

describe Gitlab::BackgroundMigration::ArchiveLegacyTraces, :migration, schema: 20180529152628 do
  include TraceHelpers

  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:builds) { table(:ci_builds) }
  let(:job_artifacts) { table(:ci_job_artifacts) }

  before do
    namespaces.create!(id: 123, name: 'gitlab1', path: 'gitlab1')
    projects.create!(id: 123, name: 'gitlab1', path: 'gitlab1', namespace_id: 123)
    @build = builds.create!(id: 1, project_id: 123, status: 'success', type: 'Ci::Build')
  end

  context 'when trace file exsits at the right place' do
    before do
      create_legacy_trace(@build, 'trace in file')
    end

    it 'correctly archive legacy traces' 

  end

  context 'when trace file does not exsits at the right place' do
    it 'does not raise errors nor create job artifact' 

  end

  context 'when trace data exsits in database' do
    before do
      create_legacy_trace_in_db(@build, 'trace in db')
    end

    it 'correctly archive legacy traces' 

  end
end

