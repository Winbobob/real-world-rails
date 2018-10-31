require 'spec_helper'
require 'rake'

describe "admin rake tasks" do
  before do
    # Code for activating rake, adapted from:
    # spec/miscellaneous/lib/tasks/resque.rake_spec.rb
    @rake = Rake.application
    @rake.init
    @rake.load_rakefile
  end

  after do
    @rake.clear
  end

  describe "purging unconfirmed users" do
    context "when the unconfirmed account is younger than two weeks" do
      it "doesn't delete the account" 

    end

    context "when the unconfirmed account is older than two weeks" do
      it "deletes the account" 


      it "resets the account's invitation" 

    end
  end
end

