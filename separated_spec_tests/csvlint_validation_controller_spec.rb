require 'spec_helper'

describe ValidationController, type: :controller do

  describe "GET 'index'" do

    it 'generates a CSV of all validations with a url' 


  end

  describe "POST 'update'" do

    before(:each) do
      @connection = double(CloudFlare::Connection)

      allow(CloudFlare::Connection).to receive(:new) {
        allow(@connection).to receive(:zone_file_purge)
        @connection
      }
    end

    it "updates a CSV sucessfully" 


    it "updates a CSV with a new schema sucessfully" 


    it 'purges the cache when updating' 


  end

  describe "GET 'show' PNG" do

    it "returns valid image for a good CSV" 


    it "returns invalid image for a CSV with errors" 


    it "returns warning image for a CSV with warnings" 


  end

  describe "GET 'show' SVG" do

    it "returns valid image for a good CSV" 


    it "returns invalid image for a CSV with errors" 


    it "returns warning image for a CSV with warnings" 


    it "queues another check when the image is loaded" 


    it "doesn't queue another check when the image is loaded if revalidate is false" 


  end

end

