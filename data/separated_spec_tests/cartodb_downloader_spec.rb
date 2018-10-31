# encoding: utf-8
require_relative '../../../../spec/spec_helper_min'
require_relative '../../lib/importer/downloader'
require_relative '../../../../lib/carto/url_validator'
require_relative '../../../../spec/helpers/file_server_helper'

include CartoDB::Importer2
include FileServerHelper

describe Downloader do
  before do
    @file_url =
      "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_lakes.zip"
    @file_filepath = path_to('ne_110m_lakes.zip')
    @file_url_without_extension = "http://www.example.com/foowithoutextension"
    @file_filepath_without_extension  = path_to('foowithoutextension')
    @file_url_with_wrong_extension = "http://www.example.com/csvwithwrongextension.xml"
    @file_filepath_with_wrong_extension  = path_to('csvwithwrongextension.xml')
    @fusion_tables_url =
      "https://www.google.com/fusiontables/exporttable" +
      "?query=select+*+from+1dimNIKKwROG1yTvJ6JlMm4-B4LxMs2YbncM4p9g"
    @fusion_tables_filepath = path_to('forest_change.csv')
    @ftp_url        = "ftp://ftp.nlm.nih.gov/nlmdata/sample/INDEX"
    @ftp_filepath   = path_to('INDEX.txt')
  end

  before(:all) { @user = FactoryGirl.create(:carto_user) }
  after(:all)  { @user.destroy }

  describe '#run' do
    it 'downloads a file from a url' 


    it 'extracts the source_file name from the URL' 


    it 'extracts the source_file name from the URL for S3 actual paths' 


    it 'extracts the source_file name from the URL for S3 paths without extra parameters' 


    it 'uses Content-Type header for files without extension' 


    it 'uses file name for file without extension and with unknown Content-Type header' 


    it 'uses file name for file with extension and with unknown Content-Type header' 


    it 'ignores extra type parameters in Content-Type header' 


    it 'uses Content-Type header extension for files with different extension' 


    it 'sets the right file extension for file without extension in a multi extension Content-Type' 


    it 'uses the right file extension based in a multiple file extension Content-Type scenario' 


    it 'uses the geojson extension if the header is text/plain' 


    it 'uses the kml extension if the header is text/plain' 


    it 'extracts the source_file name from Content-Disposition header' 


    it 'supports FTP urls' 


    it 'supports accented URLs' 


    it 'does not break urls with % on it' 


    it 'does not break local filenames with special characters on it' 


    it "doesn't download the file if ETag hasn't changed" 


    it "raises if remote URL doesn't respond with a 2XX code" 


    it "raises if download fails with partial file error" 


    describe '#etag' do
      it "reads etag from download" 

    end

    describe('#quota_checks') do
      before(:all) do
        @old_max_import_file_size = @user.max_import_file_size
        @user.max_import_file_size = 1024
        @user.save
      end

      after(:all) do
        @user.max_import_file_size = @old_max_import_file_size
        @user.save
      end

      it 'raises when file size is bigger than available quota before download' 


      it 'raises when file size is bigger than available quota during download' 

    end
  end

  describe '#source_file' do
    it 'returns nil if no download initiated' 


    it 'returns a source file based on the path if passed a file path' 


    it 'returns a source_file name' 


    it 'returns a local filepath' 

  end

  describe '#name inference' do
    it 'gets the file name from the Content-Disposition header if present' 


    it 'gets the file name from the URL if no Content-Disposition header' 


    it 'gets the file name from the URL if no Content-Disposition header and custom params schema is used' 


    it 'uses random name in no name can be found in url or http headers' 


    it 'discards url query params' 


    it 'matches longer extension available from filename' 

  end

  def path_to(filename)
    File.join(File.dirname(__FILE__), '..', 'fixtures', filename)
  end
end

