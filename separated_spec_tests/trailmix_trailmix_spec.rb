require "rake"

describe "trailmix:schedule_all_prompts", sidekiq: :inline do
  before do
    load "tasks/trailmix.rake"
    Rake::Task.define_task(:environment)
  end

  it "sends prompts to all users that would like a prompt" 


  def emailed_addresses
    ActionMailer::Base.deliveries.map(&:to).flatten
  end
end

