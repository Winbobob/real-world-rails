require 'spec_helper'

describe ApiController do
  shared_examples "an authenticated API" do
    shared_examples "not authorised" do
      it { expect(subject.status).to eq 401 }
      it { expect(subject.body).to eq '{"error":"not authorised - use a valid api key - https://www.openaustraliafoundation.org.au/2015/03/02/planningalerts-api-changes"}' }
    end

    context "no API key is given" do
      subject { get method, params.merge(key: nil) }
      include_examples "not authorised"
    end

    context "invalid API key is given" do
      subject { get method, params.merge(key: "jsdfhsd") }
      include_examples "not authorised"
    end

    context "user has API access disabled" do
      subject do
        user = FactoryGirl.create(:user, api_disabled: true)
        get method, params.merge(key: user.api_key)
      end
      include_examples "not authorised"
    end
  end

  let(:user) { create(:user, email: "foo@bar.com", password: "foofoo")}

  describe "#all" do
    describe "rss" do
      it "should not support rss" 

    end

    describe "json" do
      it_behaves_like "an authenticated API" do
        let(:method) { :all }
        let(:params) { { format: "js" } }
      end

      it "should error if valid api key is given but no bulk api access" 


      it "should find recent applications if api key is given" 

    end
  end

  describe "#postcode" do
    # TODO: Make errors work with rss format
    it_behaves_like "an authenticated API" do
      let(:method) { :postcode }
      let(:params) { { format: "js", postcode: "2780" } }
    end

    it "should find recent applications for a postcode" 


    it "should support jsonp" 


    it "should support json api version 2" 

  end

  describe "#point" do
    it_behaves_like "an authenticated API" do
      let(:method) { :point }
      let(:params) { { format: "js", address: "24 Bruce Road Glenbrook", radius: 4000 } }
    end

    describe "failed search by address" do
      it "should error if some unknown parameters are included" 

    end

    describe "search by address" do
      before :each do
        location = double(lat: 1.0, lng: 2.0, full_address: "24 Bruce Road, Glenbrook NSW 2773")
        @result = double

        expect(Location).to receive(:geocode).with("24 Bruce Road Glenbrook").and_return(location)
        allow(Application).to receive_message_chain(:near, :paginate).and_return(@result)
      end

      it "should find recent applications near the address" 


      it "should find recent applications near the address using the old parameter name" 


      it "should log the api call" 


      it "should use a search radius of 2000 when none is specified" 

    end

    describe "search by lat & lng" do
      before :each do
        @result = double

        allow(Application).to receive_message_chain(:near, :paginate).and_return(@result)
      end

      it "should find recent applications near the point" 


      it "should find recent applications near the point using the old parameter name" 

    end
  end

  describe "#area" do
    it_behaves_like "an authenticated API" do
      let(:method) { :area }
      let(:params) do
        { format: "js", bottom_left_lat: 1.0, bottom_left_lng: 2.0,
          top_right_lat: 3.0, top_right_lng: 4.0 }
      end
    end

    it "should find recent applications in an area" 

  end

  describe "#authority" do
    it_behaves_like "an authenticated API" do
      let(:method) { :authority }
      let(:params) { { format: "js", authority_id: "blue_mountains" } }
    end

    it "should find recent applications for an authority" 

  end

  describe "#suburb" do
    it_behaves_like "an authenticated API" do
      let(:method) { :suburb }
      let(:params) { { format: "js", suburb: "Katoomba" } }
    end

    it "should find recent applications for a suburb" 


    describe "search by suburb and state" do
      it "should find recent applications for a suburb and state" 

    end
  end

  describe "#date_scraped" do
    it_behaves_like "an authenticated API" do
      let(:method) { :date_scraped }
      let(:params) { { format: "js", date_scraped: "2015-05-06" } }
    end

    context "valid api key is given but no bulk api access" do
      subject { get :date_scraped, key: FactoryGirl.create(:user).api_key, format: "js", date_scraped: "2015-05-06" }

      it { expect(subject.status).to eq 401 }
      it { expect(subject.body).to eq '{"error":"no bulk api access"}' }
    end

    context "valid authentication" do
      let(:user) { FactoryGirl.create(:user, bulk_api: true) }
      before(:each) do
        VCR.use_cassette('planningalerts', allow_playback_repeats: true) do
          FactoryGirl.create_list(:application, 5, date_scraped: DateTime.new(2015, 05, 05, 12, 0, 0))
          FactoryGirl.create_list(:application, 5, date_scraped: DateTime.new(2015, 05, 06, 12, 0, 0))
        end
      end
      subject { get :date_scraped, key: user.api_key, format: "js", date_scraped: "2015-05-06" }

      it { expect(subject).to be_success }
      it { expect(JSON.parse(subject.body).count).to eq 5 }

      context "invalid date" do
        subject { get :date_scraped, key: user.api_key, format: "js", date_scraped: "foobar" }
        it { expect(subject).to_not be_success }
        it { expect(subject.body).to eq '{"error":"invalid date_scraped"}' }
      end
    end
  end
end

