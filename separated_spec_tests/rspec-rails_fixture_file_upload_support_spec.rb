require 'spec_helper'

module RSpec::Rails
  describe FixtureFileUploadSupport do
    context 'with fixture path set in config' do
      it 'resolves fixture file' 

    end

    context 'with fixture path set in spec' do
      it 'resolves fixture file' 

    end

    context 'with fixture path not set' do
      it 'resolves fixture using relative path' 

    end

    def fixture_file_upload_resolved(fixture_name, fixture_path = nil)
      RSpec::Core::ExampleGroup.describe do
        include RSpec::Rails::FixtureFileUploadSupport

        self.fixture_path = fixture_path

        it 'supports fixture file upload' 

      end
    end
  end
end

