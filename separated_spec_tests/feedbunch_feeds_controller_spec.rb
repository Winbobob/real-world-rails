require 'rails_helper'

describe Api::FeedsController, type: :controller do

  before :each do
    @user = FactoryBot.create :user

    @feed1 = FactoryBot.create :feed
    @feed2 = FactoryBot.create :feed
    @feed3 = FactoryBot.create :feed

    @entry_1_1 = FactoryBot.build :entry, feed_id: @feed1.id
    @entry_1_2 = FactoryBot.build :entry, feed_id: @feed1.id
    @feed1.entries << @entry_1_1 << @entry_1_2
    @entry2 = FactoryBot.build :entry, feed_id: @feed2.id
    @feed2.entries << @entry2

    @user.subscribe @feed1.fetch_url
    @user.subscribe @feed3.fetch_url

    @folder1 = FactoryBot.build :folder, user_id: @user.id
    @folder2 = FactoryBot.create :folder
    @user.folders << @folder1
    @folder1.feeds << @feed1 << @feed3

    login_user_for_unit @user
  end

  context 'GET index' do

    context 'all feeds' do

      it 'returns success' 


      it 'assigns to @feeds only feeds owned by the user' 


      it 'assigns to @feeds only feeds with unread entries' 


      it 'assigns to @feeds all feeds if requested' 

    end

    context 'feeds in a folder' do

      it 'returns success' 


      it 'assigns to @folder the correct folder' 


      it 'assigns to @feeds only feeds with unread entries' 


      it 'assigns to @feeds all feeds if requested' 


      it 'returns 404 if user does not own folder' 

    end
  end

  context 'GET show' do

    it 'assigns to @feed the correct feed' 


    it 'returns a 404 for a feed the user is not suscribed to' 


    it 'returns a 404 for a non-existing feed' 


  end

  context 'PATCH update' do

    it 'returns a 404 for a feed the user is not suscribed to' 


    it 'returns a 404 for a non-existing feed' 


    it 'refreshes feed' 

  end

  context 'POST create' do

    it 'assigns to @job_state the new subscribe_job_state' 

  end

  context 'DELETE remove' do

    it 'returns 200' 


    it 'enqueues job to unsubscribe from feed' 


    it 'returns 404 if the feed does not exist' 


    it 'returns 404 if the user is not subscribed to the feed' 


    it 'returns 500 if there is a problem unsubscribing' 

  end
end

