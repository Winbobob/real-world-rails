require "spec_helper"

describe Heaven::Jobs::EnvironmentLockedError do
  include Deployment::Status::Matchers,
          EnvironmentLocker::Matchers

  describe ".perform" do
    let(:lock_params) do
      {
        :name_with_owner => "atmos/heaven",
        :environment => "production",
        :actor => "atmos",
        :deployment_id => "12345"
      }
    end

    it "triggers an error status with information about the lock" 

  end
end

