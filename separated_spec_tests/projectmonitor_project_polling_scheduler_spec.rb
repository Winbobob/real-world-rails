require 'spec_helper'

describe ProjectPollingScheduler do

  subject { ProjectPollingScheduler.new }

  describe '#run_once' do
    before do
      Project.delete_all
    end

    it 'should update ci projects (even when there are no projects with tracker integrations)' 


    it 'should gracefully handle ci projects that fail to update successfully' 


    it 'should update tracker projects' 


    it 'should update concourse (V2) projects' 


    it 'should exit gracefully when there are no projects' 

  end
end

