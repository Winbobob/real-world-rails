require 'spec_helper'

describe ChunkyPNG::Canvas::Operations do

  subject { reference_canvas('operations') }

  describe '#grayscale' do
    it "should not return itself" 


    it "should convert the image correctly" 


    it "should not adjust the current image" 

  end

  describe '#grayscale!' do
    it "should return itself" 


    it "should convert the image correctly" 

  end

  describe '#crop' do
    it "should crop the right pixels from the original canvas" 


    it "should not return itself" 


    it "should not adjust the current image" 


    it "should raise an exception when the cropped image falls outside the oiginal image" 

  end

  describe '#crop!' do
    context 'when cropping both width and height' do
      let(:crop_opts) { [10, 5, 4, 8] }

      it "should crop the right pixels from the original canvas" 


      it "should have a new width and height" 


      it "should return itself" 

    end

    context "when cropping just the height" do
      let(:crop_opts) { [0, 5, 16, 8] }

      it "should crop the right pixels from the original canvas" 


      it "should have a new width and height" 


      it "should return itself" 

    end

    context "when the cropped image falls outside the original image" do
      it "should raise an exception" 

    end
  end

  describe '#compose' do
    it "should compose pixels correctly" 


    it "should leave the original intact" 


    it "should not return itself" 


    it "should raise an exception when the pixels to compose fall outside the image" 

  end

  describe '#compose!' do
    it "should compose pixels correctly" 


    it "should return itself" 


    it "should compose a base image and mask correctly" 


    it "should raise an exception when the pixels to compose fall outside the image" 

  end

  describe '#replace' do
    it "should replace the correct pixels" 


    it "should not return itself" 


    it "should leave the original intact" 


    it "should raise an exception when the pixels to replace fall outside the image" 

  end

  describe '#replace!' do
    it "should replace the correct pixels" 


    it "should return itself" 


    it "should raise an exception when the pixels to replace fall outside the image" 

  end
end

describe ChunkyPNG::Canvas::Operations do

  subject { ChunkyPNG::Canvas.new(2, 3, [1, 2, 3, 4, 5, 6]) }

  describe '#flip_horizontally!' do
    it "should flip the pixels horizontally in place" 


    it "should return itself" 

  end

  describe '#flip_horizontally' do
    it "should flip the pixels horizontally" 


    it "should not return itself" 


    it "should return a copy of itself when applied twice" 

  end

  describe '#flip_vertically!' do
    it "should flip the pixels vertically" 


    it "should return itself" 

  end

  describe '#flip_vertically' do
    it "should flip the pixels vertically" 


    it "should not return itself" 


    it "should return a copy of itself when applied twice" 

  end

  describe '#rotate_left' do
    it "should rotate the pixels 90 degrees counter-clockwise" 


    it "should not return itself" 


    it "should not change the image dimensions" 


    it "it should rotate 180 degrees when applied twice" 


    it "it should rotate right when applied three times" 


    it "should return itself when applied four times" 

  end

  describe '#rotate_left!' do
    it "should rotate the pixels 90 degrees clockwise" 


    it "should return itself" 


    it "should change the image dimensions" 

  end

  describe '#rotate_right' do
    it "should rotate the pixels 90 degrees clockwise" 


    it "should not return itself" 


    it "should not change the image dimensions" 


    it "it should rotate 180 degrees when applied twice" 


    it "it should rotate left when applied three times" 


    it "should return itself when applied four times" 

  end

  describe '#rotate_right!' do
    it "should rotate the pixels 90 degrees clockwise" 


    it "should return itself" 


    it "should change the image dimensions" 

  end

  describe '#rotate_180' do
    it "should rotate the pixels 180 degrees" 


    it "should return not itself" 


    it "should return a copy of itself when applied twice" 

  end

  describe '#rotate_180!' do
    it "should rotate the pixels 180 degrees" 


    it "should return itself" 

  end
end

describe ChunkyPNG::Canvas::Operations do

  subject { ChunkyPNG::Canvas.new(4, 4).rect(1, 1, 2, 2, 255, 255) }

  describe "#trim" do
    it "should trim the border" 


    it "should not return itself" 


    it "should be able to fail to trim a specified color" 


    it "should be the same after trimming an added border" 

  end

  describe "#trim!" do
    it "should trim the border" 


    it "should return itself" 


    it "should change the image dimensions" 

  end
end

describe ChunkyPNG::Canvas::Operations do

  subject { ChunkyPNG::Canvas.new(4, 4) }

  describe "#border" do
    it "should add the border" 


    it "should not return itself" 


    it "should retain transparency" 

  end

  describe "#border!" do
    it "should add the border" 


    it "should return itself" 


    it "should retain transparency" 


    it "should change the image dimensions" 

  end
end

