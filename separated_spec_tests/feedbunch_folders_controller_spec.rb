require 'rails_helper'

describe Api::FoldersController, type: :controller do

  before :each do
    @user = FactoryBot.create :user
    @folder1 = FactoryBot.build :folder, user_id: @user.id
    @folder2 = FactoryBot.create :folder

    @feed1 = FactoryBot.create :feed
    @feed2 = FactoryBot.create :feed
    @feed3 = FactoryBot.create :feed

    @user.subscribe @feed1.fetch_url
    @user.subscribe @feed2.fetch_url
    @user.subscribe @feed3.fetch_url

    @entry1_1 = FactoryBot.build :entry, feed_id: @feed1.id
    @entry1_2 = FactoryBot.build :entry, feed_id: @feed1.id
    @feed1.entries << @entry1_1 << @entry1_2

    @entry2_1 = FactoryBot.build :entry, feed_id: @feed2.id
    @entry2_2 = FactoryBot.build :entry, feed_id: @feed2.id
    @feed2.entries << @entry2_1 << @entry2_2

    @entry3_1 = FactoryBot.build :entry, feed_id: @feed3.id
    @entry3_2 = FactoryBot.build :entry, feed_id: @feed3.id
    @feed3.entries << @entry3_1 << @entry3_2

    @user.folders << @folder1
    @folder1.feeds << @feed1 << @feed2

    login_user_for_unit @user
  end

  context 'GET index' do

    it 'returns success' 


    it 'assigns to @folders only folders owned by the user' 

  end

  context 'GET show' do

    it 'assigns the right folder' 


    it 'returns a 404 for a folder that does not belong to the user' 


    it 'returns a 404 for a non-existing folder' 


  end

  context 'PATCH move to folder' do

    it 'returns success' 


    it 'returns 404 for a folder that does not belong to the current user' 


    it 'returns 404 for a feed the current user is not subscribed to' 


    it 'returns 404 for non-existing folder' 


    it 'returns 404 for non-existing feed' 


    it 'returns 200 if the feed is already in the folder' 


    it 'returns 500 if there is a problem associating the feed with the folder' 

  end

  context 'PATCH remove from folder' do

    it 'returns success' 


    it 'returns 404 if the user is not subscribed to the feed' 


    it 'returns 404 if the feed does not exist' 


    it 'deletes the folder if the feed is successfully removed from the folder and there are no more feeds in the folder' 


    it 'returns 500 if there is a problem removing feed from folder' 

  end

  context 'POST create' do

    it 'returns success if sucessfully created folder' 


    it 'returns 304 if user already has a folder with the same title' 


    it 'assigns the new folder to @folder' 

  end
end

