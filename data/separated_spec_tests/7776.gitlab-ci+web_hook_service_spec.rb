require 'spec_helper'

describe WebHookService do
  let (:project) { FactoryGirl.create :project }
  let (:commit)  { FactoryGirl.create :commit, project: project }
  let (:build)   { FactoryGirl.create :build, commit: commit }
  let (:hook)    { FactoryGirl.create :web_hook, project: project }

  describe '#execute' do
    it "should execute successfully" 

  end

  context 'build_data' do
    it "contains all needed fields" 

  end

  def build_data(build)
    described_class.new.send :build_data, build
  end
end

