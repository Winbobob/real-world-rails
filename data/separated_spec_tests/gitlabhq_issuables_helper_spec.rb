require 'spec_helper'

describe IssuablesHelper do
  let(:label)  { build_stubbed(:label) }
  let(:label2) { build_stubbed(:label) }

  describe '#users_dropdown_label' do
    let(:user)  { build_stubbed(:user) }
    let(:user2)  { build_stubbed(:user) }

    it 'returns unassigned' 


    it 'returns selected user\'s name' 


    it 'returns selected user\'s name and counter' 

  end

  describe '#issuable_labels_tooltip' do
    it 'returns label text with no labels' 


    it 'returns label text with labels within max limit' 


    it 'returns label text with labels exceeding max limit' 

  end

  describe '#issuables_state_counter_text' do
    let(:user) { create(:user) }

    describe 'state text' do
      before do
        allow(helper).to receive(:issuables_count_for_state).and_return(42)
      end

      it 'returns "Open" when state is :opened' 


      it 'returns "Closed" when state is :closed' 


      it 'returns "Merged" when state is :merged' 


      it 'returns "All" when state is :all' 

    end
  end

  describe '#issuable_reference' do
    context 'when show_full_reference truthy' do
      it 'display issuable full reference' 

    end

    context 'when show_full_reference falsey' do
      context 'when @group present' do
        it 'display issuable reference to @group' 

      end

      context 'when @project present' do
        it 'display issuable reference to @project' 

      end
    end
  end

  describe '#updated_at_by' do
    let(:user) { create(:user) }
    let(:unedited_issuable) { create(:issue) }
    let(:edited_issuable) { create(:issue, last_edited_by: user, created_at: 3.days.ago, updated_at: 1.day.ago, last_edited_at: 2.days.ago) }
    let(:edited_updated_at_by) do
      {
        updatedAt: edited_issuable.last_edited_at.to_time.iso8601,
        updatedBy: {
          name: user.name,
          path: user_path(user)
        }
      }
    end

    it { expect(helper.updated_at_by(unedited_issuable)).to eq({}) }
    it { expect(helper.updated_at_by(edited_issuable)).to eq(edited_updated_at_by) }

    context 'when updated by a deleted user' do
      let(:edited_updated_at_by) do
        {
          updatedAt: edited_issuable.last_edited_at.to_time.iso8601,
          updatedBy: {
            name: User.ghost.name,
            path: user_path(User.ghost)
          }
        }
      end

      before do
        user.destroy
      end

      it 'returns "Ghost user" as edited_by' 

    end
  end

  describe '#issuable_initial_data' do
    let(:user) { create(:user) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).and_return(true)
    end

    it 'returns the correct json for an issue' 

  end

  describe '#selected_labels' do
    context 'if label_name param is a string' do
      it 'returns a new label with title' 

    end

    context 'if label_name param is an array' do
      it 'returns a new label with title for each element' 

    end
  end
end

