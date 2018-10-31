require "spec_helper"

describe EnvironmentLocker do
  let(:redis) { double(:redis) }

  let(:lock_params) do
    {
      :name_with_owner => "atmos/heaven",
      :environment => "production",
      :actor => "atmos"
    }
  end

  describe "#lock?" do
    it "is true if the task is deploy:lock" 


    context "with hubot deploy prefix" do
      before { stub_const("ENV", "HUBOT_DEPLOY_PREFIX" => "ship") }

      it "is true if the task is ship:lock" 

    end
  end

  describe "#unlock?" do
    it "is true if the task is deploy:unlock" 


    context "with hubot deploy prefix" do
      before { stub_const("ENV", "HUBOT_DEPLOY_PREFIX" => "ship") }

      it "is true if the task is ship:unlock" 

    end
  end

  describe "#lock!" do
    it "locks the environment for the repo and records the locker" 

  end

  describe "#unlock!" do
    it "unlocks the environment for the repo" 

  end

  describe "#locked?" do
    let(:locker) do
      EnvironmentLocker.new(lock_params).tap do |locker|
        locker.redis = redis
      end
    end

    it "is true if the repo/environment pair exists" 


    it "is false if the repo/environment pair exists" 

  end

  describe "#locked_by" do
    it "returns the user who locked the environment" 

  end
end

