# frozen_string_literal: true

#   Copyright (c) 2010-2012, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

# Tests fetching public posts of a person on a remote server
describe Diaspora::Fetcher::Public do
  before do
    # the fixture is taken from an actual json request.
    # it contains 10 StatusMessages and 5 Reshares, all of them public
    # the guid of the person is "7445f9a0a6c28ebb"
    @fixture = File.open(Rails.root.join('spec', 'fixtures', 'public_posts.json')).read
    @fetcher = Diaspora::Fetcher::Public.new
    @person = FactoryGirl.create(:person, guid:            "7445f9a0a6c28ebb",
                                          pod:             Pod.find_or_create_by(url: "https://remote-testpod.net"),
                                          diaspora_handle: "testuser@remote-testpod.net")

    stub_request(:get, /remote-testpod.net\/people\/.*\/stream/)
      .with(headers: {
            'Accept'=>'application/json',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'diaspora-fetcher'
      }).to_return(:body => @fixture)
  end

  describe "#queue_for" do
    it "queues a new job" 


    it "queues no job if the status is not initial" 

  end

  describe "#retrieve_posts" do
    before do
      person = @person
      @fetcher.instance_eval {
        @person = person
        retrieve_posts
      }
    end

    it "sets the operation status on the person" 


    it "sets the @data variable to the parsed JSON data" 

  end

  describe "#process_posts" do
    before do
      person = @person
      data = JSON.parse(@fixture)

      @fetcher.instance_eval {
        @person = person
        @data = data
      }
    end

    it 'creates 10 new posts in the database' 


    it 'sets the operation status on the person' 


    context 'created post' do
      before do
        Timecop.freeze
        @now = DateTime.now.utc
        @data = JSON.parse(@fixture).select { |item| item['post_type'] == 'StatusMessage' }

        #save posts to db
        @fetcher.instance_eval {
          process_posts
        }
      end

      after do
        Timecop.return
      end

      it 'applies the date from JSON to the record' 


      it "copied the text correctly" 


      it 'applies now to interacted_at on the record' 

    end
  end

  context "private methods" do
    let(:public_fetcher) { Diaspora::Fetcher::Public.new }

    describe '#qualifies_for_fetching?' do
      it "raises an error if the person doesn't exist" 


      it 'returns false if the person is unfetchable' 


      it 'returns false and sets the person unfetchable for a local account' 


      it 'returns false if the person is processing already (or has been processed)' 


      it "returns true, if the user is remote and hasn't been fetched" 

    end

    describe '#set_fetch_status' do
      it 'sets the current status of fetching on the person' 

    end

    describe '#validate' do
      it "calls all validation helper methods" 

    end

    describe '#check_existing' do
      it 'returns false if a post with the same guid exists' 


      it 'returns true if the guid cannot be found' 

    end

    describe '#check_author' do
      let!(:some_person) { FactoryGirl.create(:person) }

      before do
        person = some_person
        public_fetcher.instance_eval { @person = person }
      end

      it "returns false if the person doesn't match" 


      it "returns true if the persons match" 

    end

    describe '#check_public' do
      it "returns false if the post is not public" 


      it "returns true if the post is public" 

    end

    describe '#check_type' do
      it "returns false if the type is anything other that 'StatusMessage'" 


      it "returns true if the type is 'StatusMessage'" 

    end
  end
end

