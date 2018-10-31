require 'rails_helper'

describe DiscoursePoll::VotesUpdater do
  let(:target_user) { Fabricate(:user_single_email, username: 'alice', email: 'alice@example.com') }
  let(:source_user) { Fabricate(:user_single_email, username: 'alice1', email: 'alice@work.com') }
  let(:walter) { Fabricate(:walter_white) }

  let(:target_user_id) { target_user.id.to_s }
  let(:source_user_id) { source_user.id.to_s }
  let(:walter_id) { walter.id.to_s }

  let(:post_with_two_polls) do
    raw = <<~RAW
      [poll type=multiple min=2 max=3 public=true]
      - Option 1
      - Option 2
      - Option 3
      [/poll]

      [poll name=private_poll]
      - Option 1
      - Option 2
      - Option 3
      [/poll]
    RAW

    Fabricate(:post, raw: raw)
  end

  let(:option1_id) { "63eb791ab5d08fc4cc855a0703ac0dd1" }
  let(:option2_id) { "773a193533027393806fff6edd6c04f7" }
  let(:option3_id) { "f42f567ca3136ee1322d71d7745084c7" }

  def vote(post, user, option_ids, poll_name = nil)
    poll_name ||= DiscoursePoll::DEFAULT_POLL_NAME
    DiscoursePoll::Poll.vote(post.id, poll_name, option_ids, user)
  end

  it "should move votes to the target_user when only the source_user voted" 


  it "should delete votes of the source_user if the target_user voted" 


  it "does not add voter_ids unless the poll is public" 

end

