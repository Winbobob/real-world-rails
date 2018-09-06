require 'spec_helper'

describe ConfigExport do

  context 'given a full set of configuration records' do

    before do
      Project.destroy_all
      AggregateProject.destroy_all
    end

    it "should create new project when there is no guid" 


    it "should update the project when there is a guid" 


    context 'given an old configuration file with obsolete fields' do
      it 'should import the records' 

    end
  end
end

