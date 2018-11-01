# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe StatusMessagesController, :type => :controller do
  before do
    @aspect1 = alice.aspects.first

    request.env["HTTP_REFERER"] = ""
    sign_in alice, scope: :user
    allow(@controller).to receive(:current_user).and_return(alice)
    alice.reload
  end

  describe '#bookmarklet' do
    it 'succeeds' 


    it 'contains a complete html document' 


    it 'accepts get params' 

  end

  describe '#new' do
    it 'succeeds' 


    it 'should redirect on desktop version' 

  end

  describe '#create' do
    let(:text) { "facebook, is that you?" }
    let(:status_message_hash) {
      {
        status_message: {text: text},
        aspect_ids:     [@aspect1.id.to_s]
      }
    }

    it 'creates with valid json' 


    it 'creates with invalid json' 


    it 'creates with valid mobile' 


    it 'creates with invalid mobile' 


    it 'removes getting started from new users' 


    context "with aspect_ids" do
      before do
        @aspect2 = alice.aspects.create(name: "another aspect")
      end

      it "takes one aspect as array in aspect_ids" 


      it "takes one aspect as string in aspect_ids" 


      it "takes public as array in aspect_ids" 


      it "takes public as string in aspect_ids" 


      it "takes all_aspects as array in aspect_ids" 


      it "takes all_aspects as string in aspect_ids" 


      it "responses 422 when aspect_ids don't contain any applicable aspect identifiers" 

    end

    it "dispatches the post to the specified services" 


    it "works if services is a string" 


    it "doesn't overwrite author_id" 


    it "doesn't overwrite id" 


    it "calls dispatch post once subscribers is set" 


    it 'respsects provider_display_name' 


    it "has no participation" 


    context 'with photos' do
      before do
        @photo1 = alice.build_post(:photo, :pending => true, :user_file=> File.open(photo_fixture_name), :to => @aspect1.id)
        @photo2 = alice.build_post(:photo, :pending => true, :user_file=> File.open(photo_fixture_name), :to => @aspect1.id)

        @photo1.save!
        @photo2.save!

        @hash = status_message_hash
        @hash[:photos] = [@photo1.id.to_s, @photo2.id.to_s]
      end

      it "will post a photo without text" 


      it "attaches all referenced photos" 


      it "sets the pending bit of referenced photos" 

    end
  end

  describe '#remove_getting_started' do
    it 'removes the getting started flag from new users' 


    it 'does nothing for returning users' 

  end
end

