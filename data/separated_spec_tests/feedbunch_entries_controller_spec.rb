require 'rails_helper'

describe Api::EntriesController, type: :controller do

  before :each do
    @user = FactoryBot.create :user
    login_user_for_unit @user
  end

  context 'PUT update' do

    before :each do
      @feed = FactoryBot.create :feed
      @user.subscribe @feed.fetch_url
      @entry = FactoryBot.build :entry, feed_id: @feed.id
      @feed.entries << @entry
    end

    it 'assigns the correct entry' 


    it 'returns success' 


    it 'returns 404 if the entry does not exist' 


    it 'returns 404 if the user is not subscribed to the entries feed' 


    it 'returns 500 if there is a problem changing the entry state' 

  end

  context 'GET index' do

    context 'feed entries' do

      before :each do
        @feed = FactoryBot.create :feed
        @entry_1_1 = FactoryBot.build :entry, feed_id: @feed.id
        @entry_1_2 = FactoryBot.build :entry, feed_id: @feed.id
        @feed.entries << @entry_1_1 << @entry_1_2
        @user.subscribe @feed.fetch_url
      end

      it 'assigns to @feed the correct feed' 


      it 'assigns to @entries the entries for a single feed' 


      it 'returns a 404 for a feed the user is not suscribed to' 


      it 'returns a 404 for a non-existing feed' 


      it 'does not fetch new entries in the feed' 


      it 'assigns to @entries only unread entries by default' 


      it 'assigns to @entries all entries' 


      context 'pagination' do

        before :each do
          @entries = []
          # Ensure there are exactly 26 unread entries and 4 read entries
          Entry.all.each {|e| e.destroy}
          (0..29).each do |i|
            e = FactoryBot.build :entry, feed_id: @feed.id, published: Date.new(2001, 01, 30-i)
            @feed.entries << e
            @entries << e
          end
          (26..29).each do |i|
            @user.change_entries_state @entries[i], 'read'
          end
        end

        context 'unread entries' do

          it 'returns the first page of entries' 


          it 'returns the last page of entries' 


        end

        context 'all entries' do

          it 'returns the first page of entries' 


          it 'returns the last page of entries' 


        end

      end
    end

    context 'folder entries' do
      
      before :each do
        @folder1 = FactoryBot.build :folder, user_id: @user.id
        
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
      end

      it 'assigns to @entries the entries for all feeds in a single folder' 


      it 'assigns to @entries the entries for all subscribed feeds' 


      it 'returns a 404 for a folder that does not belong to the user' 


      it 'returns a 404 for a non-existing folder' 


      it 'does not fetch new entries for any feed' 


      it 'assigns to @entries only unread folder entries by default' 


      it 'assigns to @entries all folder entries' 


      it 'assigns to @entries only all unread entries by default' 


      it 'assigns to @entries all entries' 


      context 'pagination' do

        before :each do
          @entries = []

          # Ensure there are exactly 26 unread and 4 read entries in @folder1
          Entry.all.each {|e| e.destroy}
          (0..29).each do |i|
            e = FactoryBot.build :entry, feed_id: @feed1.id, published: Date.new(2001, 03, 30-i)
            @feed1.entries << e
            @entries << e
          end
          (26..29).each do |i|
            @user.change_entries_state @entries[i], 'read'
          end

          #Also there are 1 unread and 1 read entries in @feed3. which is not in any folder
          (30..31).each do |i|
            e = FactoryBot.build :entry, feed_id: @feed3.id, published: Date.new(2001, 01, 55-i)
            @feed3.entries << e
            @entries << e
          end
          @user.change_entries_state @entries[31], 'read'
        end

        context 'all feeds' do

          context 'unread entries' do

            it 'returns the first page of entries' 


            it 'returns the last page of entries' 

          end

          context 'all entries' do

            it 'returns the first page of entries' 


            it 'returns the last page of entries' 

          end

        end

        context 'single folder' do

          context 'unread entries' do

            it 'returns the first page of entries' 


            it 'returns the last page of entries' 

          end

          context 'all entries' do

            it 'returns the first page of entries' 


            it 'returns the last page of entries' 

          end

        end

      end
    end
  end
end

