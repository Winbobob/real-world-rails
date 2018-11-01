require 'spec_helper'

begin
  require 'chunky_png/rmagick'

  describe ChunkyPNG::RMagick do

    it "should import an image from RMagick correctly" 


    it "should export an image to RMagick correctly" 

  end
rescue LoadError => e
  # skipping RMagick tests
end

