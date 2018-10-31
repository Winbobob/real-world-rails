# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ContactsController, :type => :controller do
  before do
    sign_in bob, scope: :user
    allow(@controller).to receive(:current_user).and_return(bob)
  end

  describe '#index' do
    context 'format mobile' do
      it "succeeds" 

    end

    context 'format html' do
      it "succeeds" 


      it "doesn't assign contacts" 

    end

    context "format json" do
      context "for the contacts search" do
        before do
          @person1 = FactoryGirl.create(:person)
          bob.share_with(@person1, bob.aspects.first)
          @person2 = FactoryGirl.create(:person)
          @person3 = FactoryGirl.create(:person)
          bob.contacts.create(person: @person3, aspects: [bob.aspects.first], receiving: true, sharing: true)
        end

        it "succeeds" 


        it "responds with json" 


        it "only returns contacts" 


        it "only returns mutual contacts when mutual parameter is true" 

      end

      context "for pagination on the contacts page" do
        context "without parameters" do
          it "returns contacts" 


          it "returns only contacts which are receiving (the user is sharing with them)" 

        end

        context "set: all" do
          before do
            contact = bob.contacts.first
            contact.update_attributes(receiving: false)
          end

          it "returns all contacts (sharing and receiving)" 


          it "sorts contacts by receiving status" 

        end

        context "with an aspect id" do
          before do
            @aspect = bob.aspects.create(name: "awesome contacts")
            @person = FactoryGirl.create(:person)
            bob.share_with(@person, @aspect)
          end

          it "returns all contacts" 


          it "sorts contacts by aspect memberships" 

        end
      end
    end
  end

  describe '#spotlight' do
    it 'succeeds' 


    it 'gets queries for users in the app config' 

  end
end

