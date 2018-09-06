require 'active_support'
require 'active_support/core_ext/object/blank'
require_relative '../../../lib/carto/filename_generator'

describe Carto::FilenameGenerator do
  class TestFilenameGenerator
    include Carto::FilenameGenerator
  end

  describe '#filename_from_url' do
    let(:generator) { TestFilenameGenerator.new }
    let(:supported_extensions) { %w(.csv .carto .zip) }

    it 'returns the full url for just filenames' 


    it 'returns nil for unsupported extensions' 


    it 'returns the filename for normal urls' 


    it 'returns the filename for filenames with dots and other characters' 


    it 'returns the filename for weirds URLs with filenames within the parameters (see #5704)' 

  end
end

