require 'spec_helper'

describe ApiController do
  describe '#run_remote' do
    let(:user) { User.create! }
    let(:code) do
      # Is there a chance the temp file will get garbage collected?
      temp = Dir.mktmpdir do |dir|
        File.open(File.join(dir, 'scraper.rb'), 'w') do |f|
          f << %q(
puts 'Hello!'
          )
        end
        Morph::DockerUtils.create_tar_file(dir)
      end

      Rack::Test::UploadedFile.new(temp.path, nil, true)
    end
    before(:each) { user }

    it "shouldn't work without an api key" 


    it "shouldn't work without a valid api key" 


    it 'should fail when site is in read-only mode' 


    it 'should work with a valid api key' 


    skip 'should test streaming'
  end

  describe '#data' do
    let(:user) { create(:user, nickname: 'mlandauer') }
    render_views

    before :each do
      VCR.use_cassette('scraper_validations', allow_playback_repeats: true) do
        # Freezing time so that the updated time of the scraper is set to a
        # consistent time. Makes a later test easier to handle
        Timecop.freeze(Time.utc(2000)) do
          Scraper.create(owner: user, name: 'a_scraper',
                         full_name: 'mlandauer/a_scraper')
        end
      end

      allow_any_instance_of(Scraper)
        .to receive_message_chain(:database, :sql_query) do
        [
          {
            'title' => 'Foo',
            'content' => 'Bar',
            'link' => 'http://example.com',
            'date' => '2013-01-01'
          }
        ]
      end
      allow_any_instance_of(Scraper)
        .to receive_message_chain(:database, :sql_query_streaming).and_yield(
          {
            'title' => 'Foo',
            'content' => 'Bar',
            'link' => 'http://example.com',
            'date' => '2013-01-01'
          }
        )
      allow_any_instance_of(Scraper)
        .to receive_message_chain(:database, :sqlite_db_path)
        .and_return('/path/to/db.sqlite')
      allow_any_instance_of(Scraper)
        .to receive_message_chain(:database, :sqlite_db_size)
        .and_return(12)
    end

    context 'user not signed in and no key provided' do
      it 'should return an error in json' 


      it 'should return csv error as text' 


      it 'should return atom feed error as text' 


      it 'should return sqlite error as text' 

    end

    context 'user not signed in and incorrect key provided' do
      it 'should return an error in json' 


      it 'should return csv error as text' 


      it 'should return atom feed error as text' 


      it 'should return sqlite error as text' 

    end

    context 'user not signed in and correct key provided' do
      before :each do
        user.update_attributes(api_key: '1234')
      end

      it 'should return json' 


      it 'should return jsonp' 


      it 'should return csv' 


      it 'should return an atom feed' 


      # TODO: Figure out how to test the sqlite download sensibly
    end

    context 'user signed in and no key provided' do
      before :each do
        sign_in user
      end

      it 'should return error with json' 


      it 'should return error with csv' 


      it 'should return error with atom feed' 


      it 'should return error with sqlite' 

    end
  end
end

