require 'spec_helper'

describe Charts::BuildTime do
  before do
    @project = FactoryGirl.create(:project)
    @commit = FactoryGirl.create(:commit, project: @project)
    FactoryGirl.create(:build, commit: @commit)
  end

  it 'should return build times in minutes' 

end

