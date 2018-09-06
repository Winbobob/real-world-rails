require 'spec_helper'

describe ProjectTrackerWorkloadHandler do

  let(:project) { double(:project) }

  subject { ProjectTrackerWorkloadHandler.new(project) }

  describe '#workload_complete' do
    let(:project_payload) { double(:project_payload) }
    let(:current_iteration_payload) { double(:current_iteration_payload) }
    let(:iterations_payload) { double(:iterations_payload) }

    it 'should update the projects tracker metrics' 

  end

  describe '#workload_failed' do
    it 'should mark the projects tracker status to offline' 

  end

end

