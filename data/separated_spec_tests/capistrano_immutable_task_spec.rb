require "spec_helper"
require "rake"
require "capistrano/immutable_task"

module Capistrano
  describe ImmutableTask do
    after do
      # Ensure that any tasks we create in these tests don't pollute other tests
      Rake::Task.clear
    end

    it "prints warning and raises when task is enhanced" 

  end
end

