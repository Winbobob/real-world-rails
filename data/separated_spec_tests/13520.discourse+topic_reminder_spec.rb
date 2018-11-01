require 'rails_helper'

describe Jobs::TopicReminder do
  let(:admin) { Fabricate(:admin) }

  let(:topic) do
    Fabricate(:topic_timer,
      user: admin,
      status_type: TopicTimer.types[:reminder]
    ).topic
  end

  it "should be able to create a reminder" 


  it "does nothing if it was trashed before the scheduled time" 


  it "does nothing if job runs too early" 


  it "does nothing if topic was deleted" 


end

