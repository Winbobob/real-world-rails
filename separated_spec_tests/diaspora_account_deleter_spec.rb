# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe AccountDeleter do
  before do
    @account_deletion = AccountDeleter.new(bob.person)
    @account_deletion.user = bob
  end

  it "attaches the user" 


  describe '#perform' do
    person_removal_methods = %i[
      delete_contacts_of_me
      delete_standard_person_associations
      tombstone_person_and_profile
    ]

    context "user deletion" do
      after do
        @account_deletion.perform!
      end

      [*person_removal_methods, :close_user].each do |method|

        it "calls ##{method.to_s}" 

      end
    end

    context "profile deletion" do
      before do
        @profile_deletion = AccountDeleter.new(remote_raphael)
        @profile = remote_raphael.profile
      end

      it "nulls out fields in the profile" 


    end

    context "person deletion" do
      before do
        @person_deletion = AccountDeleter.new(remote_raphael)
      end

      after do
        @person_deletion.perform!
      end

      it "does not call #close_user" 


      (person_removal_methods).each do |method|

        it "calls ##{method.to_s}" 

      end
    end

  end

  describe "#close_user" do
    user_removal_methods = %i[
      delete_standard_user_associations
      remove_share_visibilities_on_contacts_posts
      disconnect_contacts tombstone_user
    ]

    after do
      @account_deletion.perform!
    end

    user_removal_methods.each do |method|
      it "calls ##{method}" 

    end
  end

  describe "#delete_standard_user_associations" do
    it 'removes all standard user associaltions' 

  end

  describe "#delete_standard_person_associations" do
    before do
      @account_deletion.person = bob.person
    end
    it 'removes all standard person associaltions' 

  end

  context "user associations" do
    describe "#disconnect_contacts" do
      it "deletes all of user's contacts" 

    end
  end

  context 'person associations' do
    describe '#delete_contacts_of_me' do
      it 'deletes all the local contact objects where deleted account is the person' 

    end

    describe '#tombstone_person_and_profile' do
      it 'calls clear_profile! on person' 


      it 'calls lock_access! on person' 

    end
  end

  describe "#remove_share_visibilities_by_contacts_of_user" do
    it "removes the share visibilities for a user" 

  end

  describe "#tombstone_user" do
    it 'calls strip_model on user' 

  end

  it "has all user association keys accounted for" 


  it "has all person association keys accounted for" 

end


