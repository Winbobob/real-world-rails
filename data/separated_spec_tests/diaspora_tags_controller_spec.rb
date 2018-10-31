# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe TagsController, :type => :controller do
  describe '#index (search)' do
    before do
      sign_in alice, scope: :user
      bob.profile.tag_string = "#cats #diaspora #rad"
      bob.profile.build_tags
      bob.profile.save!
    end

    it 'responds with json' 


    it 'requires at least two characters' 


    it 'redirects the aimless to excellent parties' 


    it 'does not allow json requestors to party' 

  end

  describe '#show' do
    context 'tag with capital letters' do
      before do
        sign_in alice, scope: :user
      end

      it 'redirect to the downcase tag uri' 

    end

    context 'with a tagged user' do
      before do
        bob.profile.tag_string = "#cats #diaspora #rad"
        bob.profile.build_tags
        bob.profile.save!
      end

      it 'includes the tagged user' 

    end

    context 'with a tagged post' do
      before do
        @post = eve.post(:status_message, text: "#what #yes #hellyes #foo tagged post", public: true, to: 'all')
      end

      context 'signed in' do
        before do
          sign_in alice, scope: :user
        end

        it 'assigns a Stream::Tag object with the current_user' 


        it 'succeeds' 


        it 'includes the tagged post' 


        it 'includes comments of the tagged post' 

      end

      context "not signed in" do
        it 'assigns a Stream::Tag object with no user' 


        it 'succeeds' 


        it 'succeeds with mobile' 


        it "returns the post with the correct age" 

      end

      it "includes the correct meta tags" 

    end
  end

  context 'helper methods' do
    describe 'tag_followed?' do
      before do
        sign_in bob
        @tag = ActsAsTaggableOn::Tag.create!(:name => "partytimeexcellent")
        allow(@controller).to receive(:current_user).and_return(bob)
        allow(@controller).to receive(:params).and_return({:name => "PARTYTIMEexcellent"})
      end

      it 'returns true if the following already exists and should be case insensitive' 


      it 'returns false if the following does not already exist' 

    end
  end
end

