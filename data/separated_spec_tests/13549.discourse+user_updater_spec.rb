require 'rails_helper'

describe UserUpdater do

  let(:acting_user) { Fabricate.build(:user) }

  describe '#update_muted_users' do
    it 'has no cross talk' 

  end

  describe '#update' do
    let(:category) { Fabricate(:category) }
    let(:tag) { Fabricate(:tag) }
    let(:tag2) { Fabricate(:tag) }

    it 'saves user' 


    it 'can update categories and tags' 


    it "doesn't remove notification prefs when updating something else" 


    it 'updates various fields' 


    it "disables email_digests when enabling mailing_list_mode" 


    it "filters theme_ids blank values before updating perferences" 


    context 'when sso overrides bio' do
      it 'does not change bio' 

    end

    context 'when update fails' do
      it 'returns false' 

    end

    context 'with permission to update title' do
      it 'allows user to change title' 

    end

    context 'title is from a badge' do
      let(:user) { Fabricate(:user, title: 'Emperor') }
      let(:badge) { Fabricate(:badge, name: 'Minion') }

      context 'badge can be used as a title' do
        before do
          badge.update_attributes(allow_title: true)
        end

        it 'can use as title, sets badge_granted_title' 


        it 'badge has not been granted, does not change title' 


        it 'changing to a title that is not from a badge, unsets badge_granted_title' 

      end

      it 'cannot use as title, does not change title' 

    end

    context 'without permission to update title' do
      it 'does not allow user to change title' 

    end

    context 'when website includes http' do
      it 'does not add http before updating' 

    end

    context 'when website does not include http' do
      it 'adds http before updating' 

    end

    context 'when custom_fields is empty string' do
      it "update is successful" 

    end

    it "logs the action" 

  end
end

