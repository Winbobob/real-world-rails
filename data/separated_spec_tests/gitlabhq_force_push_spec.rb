require 'spec_helper'

describe Gitlab::Checks::ForcePush do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository.raw }

  context "exit code checking", :skip_gitaly_mock do
    it "does not raise a runtime error if the `popen` call to git returns a zero exit code" 


    it "raises a GitError error if the `popen` call to git returns a non-zero exit code" 

  end
end

