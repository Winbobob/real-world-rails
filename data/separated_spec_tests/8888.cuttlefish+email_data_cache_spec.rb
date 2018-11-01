# frozen_string_literal: true

require "spec_helper"

describe EmailDataCache do
  let(:cache) { EmailDataCache.new(Rails.env, 1000) }

  describe ".set" do
    it "should persist the main part of the email in the filesystem" 


    it "should only keep the full data of a certain no of the emails around" 

  end

  describe ".get" do
    it "should be able to read in the data again" 


    it "should return nil if nothing is stored on the filesystem" 

  end

  describe ".safe_file_delete" do
    before :each do
      @filename = File.join(cache.data_filesystem_directory, "foo")
      cache.create_data_filesystem_directory
    end

    it "should delete a file" 


    it "should not throw an error when the file doesn't exist" 

  end
end

