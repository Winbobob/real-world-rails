require 'rails_helper'

describe DiscoursePoll::PollsUpdater do
  let(:user) { Fabricate(:user) }

  let(:post_with_two_polls) do
    raw = <<-RAW.strip_heredoc
    [poll]
    * 1
    * 2
    [/poll]

    [poll name=test]
    * 1
    * 2
    [/poll]
    RAW

    Fabricate(:post, raw: raw)
  end

  let(:post) do
    raw = <<-RAW.strip_heredoc
    [poll]
    * 1
    * 2
    [/poll]
    RAW

    Fabricate(:post, raw: raw)
  end

  let(:other_post) do
    raw = <<-RAW.strip_heredoc
    [poll]
    * 3
    * 4
    * 5
    [/poll]
    RAW

    Fabricate(:post, raw: raw)
  end

  let(:polls) do
    DiscoursePoll::PollsValidator.new(post).validate_polls
  end

  let(:polls_with_3_options) do
    DiscoursePoll::PollsValidator.new(other_post).validate_polls
  end

  let(:two_polls) do
    DiscoursePoll::PollsValidator.new(post_with_two_polls).validate_polls
  end

  describe '.update' do
    describe 'when post does not contain any polls' do
      it 'should update polls correctly' 

    end

    describe 'when post contains existing polls' do
      it "should be able to update polls correctly" 

    end

    describe 'when there are no changes' do
      it "should not do anything" 

    end

    context "public polls" do
      let(:post) do
        raw = <<-RAW.strip_heredoc
        [poll public=true]
        - A
        - B
        [/poll]
        RAW

        Fabricate(:post, raw: raw)
      end

      let(:private_poll_post) do
        raw = <<-RAW.strip_heredoc
        [poll]
        - A
        - B
        [/poll]
        RAW

        Fabricate(:post, raw: raw)
      end

      let(:private_poll) do
        DiscoursePoll::PollsValidator.new(private_poll_post).validate_polls
      end

      let(:public_poll) do
        raw = <<-RAW.strip_heredoc
        [poll public=true]
        - A
        - C
        [/poll]
        RAW

        DiscoursePoll::PollsValidator.new(Fabricate(:post, raw: raw)).validate_polls
      end

      before do
        DiscoursePoll::Poll.vote(post.id, "poll", ["5c24fc1df56d764b550ceae1b9319125"], user)
        post.reload
      end

      it "should not allow a private poll with votes to be made public" 


      it "should retain voter_ids when options have been edited" 


      it "should delete voter_ids when poll is set to private" 

    end

    context "polls of type 'multiple'" do
      let(:min_2_post) do
        raw = <<-RAW.strip_heredoc
        [poll type=multiple min=2 max=3]
        - Option 1
        - Option 2
        - Option 3
        [/poll]
        RAW

        Fabricate(:post, raw: raw)
      end

      let(:min_2_poll) do
        DiscoursePoll::PollsValidator.new(min_2_post).validate_polls
      end

      let(:min_1_post) do
        raw = <<-RAW.strip_heredoc
        [poll type=multiple min=1 max=2]
        - Option 1
        - Option 2
        - Option 3
        [/poll]
        RAW

        Fabricate(:post, raw: raw)
      end

      let(:min_1_poll) do
        DiscoursePoll::PollsValidator.new(min_1_post).validate_polls
      end

      it "should be able to update options" 

    end

    it 'should be able to edit multiple polls with votes' 


    describe "when poll edit window has expired" do
      let(:poll_edit_window_mins) { 6 }
      let(:another_post) { Fabricate(:post, created_at: Time.zone.now - poll_edit_window_mins.minutes) }

      before do
        described_class.update(another_post, polls)
        another_post.reload
        SiteSetting.poll_edit_window_mins = poll_edit_window_mins

        DiscoursePoll::Poll.vote(
          another_post.id,
          "poll",
          [polls["poll"]["options"].first["id"]],
          user
        )
      end

      it "should not allow users to edit options of current poll" 


      context "staff" do
        let(:another_user) { Fabricate(:user) }

        before do
          another_post.update_attributes!(last_editor_id: User.staff.first.id)
        end

        it "should allow staff to add polls" 


        it "should not allow staff to add options if votes have been casted" 


        it "should allow staff to add options if no votes have been casted" 


        it "should allow staff to edit options even if votes have been casted" 


        it "should allow staff to edit options if votes have not been casted" 

      end
    end
  end

  describe '.extract_option_ids' do
    it 'should return an array of the options id' 

  end

  describe '.total_votes' do
    let!(:post) do
      raw = <<-RAW.strip_heredoc
      [poll]
      * 1
      * 2
      [/poll]

      [poll name=test]
      * 1
      * 2
      [/poll]
      RAW

      Fabricate(:post, raw: raw)
    end

    it "should return the right number of votes" 

  end
end

