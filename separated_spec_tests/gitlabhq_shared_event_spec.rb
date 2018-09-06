require 'spec_helper'

shared_examples 'default query config' do
  let(:project) { create(:project) }
  let(:event) { described_class.new(project: project, stage: stage_name, options: { from: 1.day.ago }) }

  it 'has the stage attribute' 


  it 'has the projection attributes' 

end

