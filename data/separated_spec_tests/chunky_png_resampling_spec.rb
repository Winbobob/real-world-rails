require 'spec_helper'

describe ChunkyPNG::Canvas::Resampling do

  subject { reference_canvas('clock') }

  describe '#resample_nearest_neighbor' do

    it "should downscale from 2x2 to 1x1 correctly" 


    it "should upscale from 2x2 to 4x4 correctly" 


    it "should upscale both axis of the image" 


    it "should downscale both axis of the image" 


    it "should downscale the x-axis and upscale the y-axis of the image" 


    it "should not return itself" 


    it "should not change the original image's dimensions" 

  end

  describe '#resample_nearest_neighbor!' do
    it "should upscale both axis of the image" 


    it "should downscale both axis of the image" 


    it "should downscale the x-axis and upscale the y-axis of the image" 


    it "should return itself" 


    it "should change the original image's dimensions" 

  end

  describe "#resample_bilinear" do
    it "should downscale from 2x2 to 1x1 correctly" 


    it "should upscale from 2x2 to 4x4 correctly" 


    it "should upscale both axis of the image" 


    it "should downscale both axis of the image" 


    it "should downscale the x-axis and upscale the y-axis of the image" 


    it "should not return itself" 


    it "should not change the original image's dimensions" 

  end

  describe '#resample_bilinear!' do
    it "should upscale both axis of the image" 


    it "should downscale both axis of the image" 


    it "should downscale the x-axis and upscale the y-axis of the image" 


    it "should return itself" 


    it "should change the original image's dimensions" 

  end
end

