require "rails_helper"
require "rake"

describe "namespace repo" do
  before :all do
    Rake.application.rake_require "tasks/repo"
    Rake::Task.define_task(:environment)
  end

  describe "task remove_without_memberships" do
    it "removes repos without memberships" 

  end
end

