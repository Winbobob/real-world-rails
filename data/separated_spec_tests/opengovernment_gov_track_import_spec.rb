require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require Rails.root + 'lib/gov_track_importer'

describe GovTrackImporter do
  before(:all) do
    @data_dir = File.join(Rails.root, 'data')
    @data_url = "file://#{Rails.root}/spec/fixtures/data/gov_track_sample.xml"
    @data_file = File.join(@data_dir, File.basename(@data_url))
    File.delete(File.join(@data_file)) if File.exist?(@data_file)

    @importer = GovTrackImporter.new(:data_url => @data_url, :data_dir => @data_dir)
  end

  context ".fetch_data" do
    it "should fetch the data to the given directory" 

  end

  context "#import" do
    before do
      @raw_data = Nokogiri::XML(File.read(@data_file))
      @people = @raw_data.search('//person')
    end

    it "should should import the given people" 

  end

  after(:all) do
    File.delete(File.join(@data_file)) if File.exist?(@data_file)
  end
end

