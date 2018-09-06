require "spec_helper"
require "api/api_helper"

include ApiHelper

describe "API WorksController - Create works" do

  describe "API import with a valid archivist" do
    before :all do
      mock_external
      @user = create_archivist
    end

    after :all do
      WebMock.reset!
      @user.destroy if @user
    end

    it "should not support the deprecated /import end-point", type: :routing do
      expect(post: "/api/v1/import").not_to be_routable
    end

    it "should return 200 OK when all stories are created" 


    it "should return 200 OK with an error message when no stories are created" 


    it "should return 200 OK with an error message when only some stories are created" 


    it "should return the original id" 


    it "should send claim emails if send_claim_email is true" 


    it "should return 400 Bad Request if no works are specified" 


    it "should return a helpful message if the external work contains no text" 


    describe "Provided API metadata should be used if present" do
      before(:all) do
        Rails.cache.clear

        mock_external

        valid_params = {
          archivist: @user.login,
          works: [
            { id: "123",
              title: api_fields[:title],
              summary: api_fields[:summary],
              fandoms: api_fields[:fandoms],
              warnings: api_fields[:warnings],
              characters: api_fields[:characters],
              rating: api_fields[:rating],
              relationships: api_fields[:relationships],
              categories: api_fields[:categories],
              additional_tags: api_fields[:freeform],
              external_author_name: api_fields[:external_author_name],
              external_author_email: api_fields[:external_author_email],
              notes: api_fields[:notes],
              chapter_urls: ["http://foo"] }
          ]
        }

        post "/api/v1/works", params: valid_params.to_json, headers: valid_headers
        parsed_body = JSON.parse(response.body, symbolize_names: true)

        @work = Work.find_by_url(parsed_body[:works].first[:original_url])
      end

      after(:all) do
        @work.destroy if @work
        WebMock.reset!
      end


      it "API should override content for Title" 


      it "API should override content for Summary" 


      it "API should override content for Fandoms" 

      it "API should override content for Warnings" 

      it "API should override content for Characters" 

      it "API should override content for Ratings" 

      it "API should override content for Relationships" 

      it "API should override content for Categories" 

      it "API should override content for Additional Tags" 

      it "API should override content for Notes" 

      it "API should override content for Author pseud" 

    end

    describe "Metadata should be extracted from content if no API metadata is supplied" do
      before(:all) do
        mock_external

        valid_params = {
          archivist: @user.login,
          works: [
            { external_author_name: api_fields[:external_author_name],
              external_author_email: api_fields[:external_author_email],
              chapter_urls: ["http://foo"] }
          ]
        }

        post "/api/v1/works", params: valid_params.to_json, headers: valid_headers

        parsed_body = JSON.parse(response.body, symbolize_names: true)
        @work = Work.find_by_url(parsed_body[:works].first[:original_url])
        created_user = ExternalAuthor.find_by(email: api_fields[:external_author_email])
        created_user.destroy unless created_user.nil?
      end

      after(:all) do
        @work.destroy if @work
        WebMock.reset!
      end

      it "Title should be detected from the content" 

      it "Summary should be detected from the content" 

      it "Date should be detected from the content" 

      it "Chapter title should be detected from the content" 

      it "Fandoms should be detected from the content" 

      it "Warnings should be detected from the content" 

      it "Characters should be detected from the content" 

      it "Ratings should be detected from the content" 

      it "Relationships should be detected from the content" 

      it "Categories should be detected from the content" 

      it "Additional Tags should be detected from the content" 

      it "Notes should be detected from the content" 

    end

    describe "Imports should use fallback values or nil if no metadata is supplied" do
      before(:all) do
        mock_external
        valid_params = {
          archivist: @user.login,
          works: [
            { external_author_name: api_fields[:external_author_name],
              external_author_email: api_fields[:external_author_email],
              chapter_urls: ["http://no-metadata"] }
          ]
        }

        post "/api/v1/works", params: valid_params.to_json, headers: valid_headers

        parsed_body = JSON.parse(response.body, symbolize_names: true)
        @work = Work.find_by_url(parsed_body[:works].first[:original_url])
      end

      after(:all) do
        @work.destroy if @work
        WebMock.reset!
      end

      it "Title should be the default fallback title for imported works" 

      it "Summary should be blank" 

      it "Date should be todayish" 

      it "Chapter title should be blank" 

      it "Fandoms should be the default Archive fandom ('No Fandom')" 

      it "Warnings should be the default Archive warning" 

      it "Characters should be empty" 

      it "Ratings should be the default Archive rating" 

      it "Relationships should be empty" 

      it "Categories should be empty" 

      it "Additional Tags should be empty" 

      it "Notes should be empty" 

      it "Author pseud" 

    end

    describe "Provided API metadata should be used if present and tag detection is turned off" do
      before(:all) do
        mock_external

        valid_params = {
          archivist: @user.login,
          works: [
            { id: "123",
              title: api_fields[:title],
              detect_tags: false,
              summary: api_fields[:summary],
              fandoms: api_fields[:fandoms],
              warnings: api_fields[:warnings],
              characters: api_fields[:characters],
              rating: api_fields[:rating],
              relationships: api_fields[:relationships],
              categories: api_fields[:categories],
              additional_tags: api_fields[:freeform],
              external_author_name: api_fields[:external_author_name],
              external_author_email: api_fields[:external_author_email],
              notes: api_fields[:notes],
              chapter_urls: ["http://foo"] }
          ]
        }

        post "/api/v1/works", params: valid_params.to_json, headers: valid_headers

        parsed_body = JSON.parse(response.body, symbolize_names: true)
        @work = Work.find_by_url(parsed_body[:works].first[:original_url])
      end

      after(:all) do
        @work.destroy if @work
        WebMock.reset!
      end

      it "API should override content for Title" 

      it "API should override content for Summary" 

      it "Date should be detected from the content" 

      it "Chapter title should be detected from the content" 

      it "API should override content for Fandoms" 

      it "API should override content for Warnings" 

      it "API should override content for Characters" 

      it "API should override content for Ratings" 

      it "API should override content for Relationships" 

      it "API should override content for Categories" 

      it "API should override content for Additional Tags" 

      it "API should override content for Notes" 

      it "API should override content for Author pseud" 

    end

    describe "Some fields should be detected and others use fallback values or nil if no metadata is supplied and tag detection is turned off" do
      before(:all) do
        mock_external

        valid_params = {
          archivist: @user.login,
          works: [
            { external_author_name: api_fields[:external_author_name],
              external_author_email: api_fields[:external_author_email],
              detect_tags: false,
              chapter_urls: ["http://foo"] }
          ]
        }

        post "/api/v1/works", params: valid_params.to_json, headers: valid_headers

        parsed_body = JSON.parse(response.body, symbolize_names: true)
        @work = Work.find_by_url(parsed_body[:works].first[:original_url])
      end

      after(:all) do
        @work.destroy if @work
        WebMock.reset!
      end

      it "Title should be detected from the content" 

      it "Summary should be detected from the content" 

      it "Date should be detected from the content" 

      it "Chapter title should be detected from the content" 

      it "Fandoms should be the default Archive fandom ('No Fandom')" 

      it "Warnings should be the default Archive warning" 

      it "Characters should be empty" 

      it "Ratings should be the default Archive rating" 

      it "Relationships should be empty" 

      it "Categories should be empty" 

      it "Additional Tags should be empty" 

      it "Notes should be empty" 

      it "Author pseud" 

    end
  end
end

describe "API WorksController - Find Works" do
  before do
    @work = FactoryGirl.create(:work, posted: true, imported_from_url: "foo")
  end

  after do
    @work.destroy if @work
  end

  describe "valid work URL request" do
    it "should return 200 OK" 


    it "should return the work URL for an imported work" 


    it "should return the original reference if one was provided" 


    it "should return an error when no URLs are provided" 


    it "should return an error when too many URLs are provided" 


    it "should return an error for a work that wasn't imported" 


    it "should only do an exact match on the original url" 

  end
end

describe "API WorksController - Unit Tests" do
  before do
    @under_test = Api::V1::WorksController.new
  end

  it "work_url_from_external should return an error message when the work URL is blank" 


  it "send_external_invites should call find_or_invite on each external author" 


  describe "work_errors" do
    it "should return an error if a work doesn't contain chapter urls" 


    it "should return an error if a work has too many chapters" 

  end
end

