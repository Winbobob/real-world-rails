# frozen_string_literal: true

describe MetaDataHelper, type: :helper do
  describe "#meta_tag" do
    it "returns an empty string if passed an empty hash" 


    it "returns a meta tag with the passed attributes" 


    it "returns a list of the same meta type if the value for :content in the passed attribute is an array" 

  end

  describe '#metas_tags' do
    before do
      @attributes = {
        description: {name: "description", content: "i am a test"},
        og_website:  {property: "og:website", content: "http://www.test2.com"}
      }
      default_attributes = {
        description: {name: "description", content: "default description"},
        og_url:      {property: "og:url",  content: "http://www.defaulturl.com"}
      }
      allow(helper).to receive(:general_metas).and_return(default_attributes)
    end

    it "returns the default meta datas if passed nothing" 


    it "combines by default the general meta datas with the passed attributes" 


    it "does not combines the general meta datas with the passed attributes if option is disabled" 

  end
end

