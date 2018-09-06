require 'rails_helper'

RSpec.describe DownloadService do
  subject { DownloadService }

  context 'windows', :vcr do
    before do
      subject.download_windows_versions
    end

    it 'reaches out to GitHub for releases' 


    it 'creates Downloads with a windows platform' 


    it 'should have the correct download URL' 

  end

  context 'mac', :vcr do
    before do
      subject.download_mac_versions
    end

    it 'reaches out to Sourceforge for relases' 


    it 'creates Downloads with a mac platform' 


    it 'should have the correct download URL' 

  end
end

