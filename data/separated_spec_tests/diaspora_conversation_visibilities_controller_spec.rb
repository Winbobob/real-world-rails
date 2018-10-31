# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ConversationVisibilitiesController, :type => :controller do
  before do
    @user1 = alice
    sign_in @user1, scope: :user

    hash = {
      :author => @user1.person,
      :participant_ids => [@user1.contacts.first.person.id, @user1.person.id],
      :subject => 'not spam',
      :messages_attributes => [ {:author => @user1.person, :text => 'cool stuff'} ]
    }
    @conversation = Conversation.create(hash)
  end

  describe '#destroy' do
    it 'deletes the visibility' 


    it 'does not let a user destroy a visibility that is not theirs' 


    it 'returns "hidden"' 


    it 'returns "deleted" when last participant' 

  end
end

