require 'spec_helper'

module WebMock
  describe VersionChecker do
    it 'prints a warning if the major version is too low' 


    it 'prints a warning if the minor version is too low' 


    it 'prints a warning if the patch version is too low' 


    it 'prints a warning if the patch version is too low and max version is not specified' 


    it 'prints a warning if the major version is too high' 


    it 'prints a warning if the minor version is too high' 


    it 'does not raise an error or print a warning when the major version is between the min and max' 


    it 'does not raise an error or print a warning when the min_patch is 0.6.5, the max_minor is 0.7 and the version is 0.7.3' 


    it 'does not raise an error or print a warning when the min_patch is 0.6.5, the max_minor is not specified and the version is 0.8.3' 


    it "prints warning if version is unsupported" 

  end
end

