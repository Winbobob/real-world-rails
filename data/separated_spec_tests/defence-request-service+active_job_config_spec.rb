require "spec_helper"
require "rails_helper"

require_relative "../../lib/active_job_config"

RSpec.describe ActiveJobConfig do
  describe "#name" do
    let(:queue_prefix) { "irrelevant_test_queue_prefix" }
    let(:queue_type) { "emails" }

    let(:queue_name) { "#{queue_prefix}_#{queue_type}_queue"}

    it "should return the correct queue name" 

  end
end

