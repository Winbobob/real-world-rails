require 'spec_helper'

describe CreateCommitService do
  let(:service) { described_class.new }
  let(:project) { FactoryGirl.create(:project) }
  
  describe '#execute' do
    context 'valid params' do
      let(:commit) do 
        service.execute(project,
          ref: 'refs/heads/master',
          before: '00000000',
          after: '31das312',
          ci_yaml_file: gitlab_ci_yaml,
          commits: [ { message: "Message" } ]
        )
      end

      it { expect(commit).to be_kind_of(Commit) }
      it { expect(commit).to be_valid }
      it { expect(commit).to be_persisted }
      it { expect(commit).to eq project.commits.last }
      it { expect(commit.builds.first).to be_kind_of(Build) }
    end

    context "skip tag if there is no build for it" do
      it "creates commit if there is appropriate job" 


      it "creates commit if there is no appropriate job but deploy job has right ref setting" 

    end

    describe '#ci_skip?' do
      it "skips builds creation if there is [ci skip] tag in commit message" 


      it "does not skips builds creation if there is no [ci skip] tag in commit message" 


      it "skips builds creation if there is [ci skip] tag in commit message and yaml is invalid" 

    end

    it "skips build creation if there are already builds" 


    it "creates commit with failed status if yaml is invalid" 

  end
end

