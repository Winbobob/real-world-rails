require 'spec_helper'

describe Projects::DetectRepositoryLanguagesService, :clean_gitlab_redis_shared_state do
  set(:project) { create(:project, :repository) }

  subject { described_class.new(project, project.owner) }

  describe '#execute' do
    context 'without previous detection' do
      it 'inserts new programming languages in the database' 


      it 'inserts the repository langauges' 

    end

    context 'with a previous detection' do
      before do
        subject.execute

        allow(project.repository).to receive(:languages).and_return(
          [{ value: 99.63, label: "Ruby", color: "#701516", highlight: "#701516" },
           { value: 0.3, label: "D", color: "#701516", highlight: "#701516" }]
        )
      end

      it 'updates the repository languages' 

    end

    context 'when no repository exists' do
      set(:project) { create(:project) }

      it 'has no languages' 

    end
  end
end

