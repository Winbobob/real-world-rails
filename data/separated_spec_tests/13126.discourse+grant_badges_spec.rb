require 'rails_helper'

RSpec.describe Jobs::DiscourseNarrativeBot::GrantBadges do
  let(:user) { Fabricate(:user) }
  let(:other_user) { Fabricate(:user) }

  before do
    DiscourseNarrativeBot::Store.set(user.id, completed: [
      DiscourseNarrativeBot::NewUserNarrative.to_s,
      DiscourseNarrativeBot::AdvancedUserNarrative.to_s
    ])
  end

  it 'should grant the right badges' 

end

