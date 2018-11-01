require 'rails_helper'

describe DryRunnable do
  class Agents::SandboxedAgent < Agent
    default_schedule "3pm"

    can_dry_run!

    def check
      perform
    end

    def receive(events)
      events.each do |event|
        perform(event.payload['prefix'])
      end
    end

    private

    def perform(prefix = nil)
      log "Logging"
      create_event payload: { 'test' => "#{prefix}foo" }
      error "Recording error"
      create_event payload: { 'test' => "#{prefix}bar" }
      self.memory = { 'last_status' => 'ok', 'dry_run' => dry_run? }
      save!
    end
  end

  before do
    stub(Agents::SandboxedAgent).valid_type?("Agents::SandboxedAgent") { true }

    @agent = Agents::SandboxedAgent.create(name: "some agent") { |agent|
      agent.user = users(:bob)
    }
  end

  def counts
    [users(:bob).agents.count, users(:bob).events.count, users(:bob).logs.count]
  end

  it "does not affect normal run, with dry_run? returning false" 


  it "does not perform dry-run if Agent does not support dry-run" 


  describe "dry_run!" do
    it "traps any destructive operations during a run" 


    it "traps any destructive operations during a run when an event is given" 

  end
end

