require "active_model"
require "calagator/blacklist_validator"

module Calagator

describe BlacklistValidator do
  let(:klass) do
    Class.new do
      include ActiveModel::Validations
      validates :title, blacklist: true
      attr_accessor :title
    end
  end

  subject { klass.new }

  describe "with default blacklist" do
    it "should be valid when clean" 


    it "should not be valid when it features blacklisted word" 

  end

  describe "with custom blacklist" do
    before do
      klass.validates :title, blacklist: { patterns: [/Kltpzyxm/i] }
    end

    it "should be valid when clean" 


    it "should not be valid when it features custom blacklisted word" 

  end

  describe "created with custom blacklist file" do
    let(:blacklist_file_path) { Rails.root.join("config/blacklist.txt") }

    before do
      allow(File).to receive(:exists?).with(blacklist_file_path).and_return(true)
      expect(File).to receive(:readlines).with(blacklist_file_path).and_return(["Kltpzyxm"])
    end

    it "should be valid when clean" 


    it "should not be valid when it features custom blacklisted word" 

  end
end

end

