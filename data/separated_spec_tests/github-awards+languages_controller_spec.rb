require "rails_helper"

describe Api::V0::LanguagesController do

  describe 'GET#index' do
    def response_hash
      @response_body = JSON.parse(response.body)
    end

    before(:each) do
      File.stubs(:read).returns(["JavaScript","C#","Ruby"].to_json)
    end

    it "returns all languages" 


    context "sorting not defined" do
      it 'should return a list of languages ordered alphabetically' 

    end

    context "sort by popularity" do
      it 'should return a list of languages ordered by popularity' 

    end

    context "sort alphabetically" do
      it 'should return a list of languages ordered alphabetically' 

    end
  end
end

