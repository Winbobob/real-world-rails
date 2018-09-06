require 'spec_helper'

describe Gitlab::ImportExport::AfterExportStrategies::WebUploadStrategy do
  let(:example_url) { 'http://www.example.com' }
  let(:strategy) { subject.new(url: example_url, http_method: 'post') }
  let!(:project) { create(:project, :with_export) }
  let!(:user) { build(:user) }

  subject { described_class }

  describe 'validations' do
    it 'only POST and PUT method allowed' 


    it 'onyl allow urls as upload urls' 

  end

  describe '#execute' do
    it 'removes the exported project file after the upload' 

  end
end

