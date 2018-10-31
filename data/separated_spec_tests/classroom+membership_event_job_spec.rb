# frozen_string_literal: true

require "rails_helper"

RSpec.describe MembershipEventJob, type: :job do
  let(:payload)      { json_payload("webhook_events/team_member_removed.json") }
  let(:organization) { classroom_org }
  let(:student)      { classroom_student }

  context "ACTION member_removed", :vcr do
    it "removes user from team" 

  end
end

