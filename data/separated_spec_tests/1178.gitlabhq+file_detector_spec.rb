require 'spec_helper'

describe Gitlab::FileDetector do
  describe '.types_in_paths' do
    it 'returns the file types for the given paths' 


    it 'does not include unrecognized file paths' 

  end

  describe '.type_of' do
    it 'returns the type of a README file' 


    it 'returns nil for a README file in a directory' 


    it 'returns the type of a changelog file' 


    it 'returns the type of a license file' 


    it 'returns nil for an UNCOPYING file' 


    it 'returns the type of a version file' 


    it 'returns the type of a .gitignore file' 


    it 'returns the type of a GitLab CI config file' 


    it 'returns the type of an avatar' 


    it 'returns the type of an issue template' 


    it 'returns the type of a merge request template' 


    it 'returns nil for an unknown file' 

  end
end

