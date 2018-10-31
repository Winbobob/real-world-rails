# frozen_string_literal: true

require "rails_helper"

RSpec.describe RepositoryEventJob, type: :job do
  let(:organization) { classroom_org                                          }
  let(:payload)      { json_payload("webhook_events/repository_deleted.json") }

  context "ACTION deleted", :vcr do
    after do
      Group.destroy_all
    end

    it "deletes the matching AssignmentRepo" 


    # TODO: Fixup this test so we don't have this many dependencies.
    # This is kind of ridiculous.
    it "deletes the matching GroupAssignmentRepo" 

  end
end

