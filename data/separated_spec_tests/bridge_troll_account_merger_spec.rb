require 'rails_helper'

describe AccountMerger do
  before do
    allow_any_instance_of(AccountMerger).to receive(:get_answer).and_return('y')
  end

  describe 'merging two users' do
    before do
      @user_to_keep = create(:rsvp).user
      @user_to_merge = create(:rsvp).user
      @other_user = create(:rsvp).user

      event_both_attended = create(:event)
      create(:rsvp, user: @user_to_keep, event: event_both_attended)
      create(:rsvp, user: @user_to_merge, event: event_both_attended)
    end

    it 'merges all the RSVPs from one account onto another' 

  end

  it 'refuses to merge the same account onto itself' 

end

