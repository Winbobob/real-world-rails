# frozen_string_literal: true

require "rails_helper"

RSpec.describe PingEventJob, type: :job do
  let(:payload) { json_payload("webhook_events/ping.json") }

  it "updates the organization to show the webhook is active" 

end

