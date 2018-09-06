require 'spec_helper'

describe 'ChunyPNG.Color' do
  it 'should interpret 4 arguments as RGBA values' 


  it 'should interpret 3 arguments as RGBA values' 


  it 'should interpret 2 arguments as a color to parse and an opacity value' 


  it 'should interpret 1 argument as a color to parse' 

end

describe ChunkyPNG::Color do
  include ChunkyPNG::Color

  before(:each) do
    @white             = 0xffffffff
    @black             = 0x000000ff
    @opaque            = 0x0a6496ff
    @non_opaque        = 0x0a649664
    @fully_transparent = 0x0a649600
    @red               = 0xff0000ff
    @green             = 0x00ff00ff
    @blue              = 0x0000ffff
  end

  describe '#parse' do
    it 'should interpret a hex string correctly' 


    it 'should interpret a color name correctly' 


    it 'should return numbers as is' 

  end

  describe '#pixel_bytesize' do
    it 'should return the normal amount of bytes with a bit depth of 8' 


    it 'should return a multiple of the normal amount of bytes with a bit depth greater than 8' 


    it 'should return 1 with a bit depth lower than 0' 

  end

  describe '#pass_bytesize' do
    it 'should calculate a pass size correctly' 


    it 'should return 0 if one of the dimensions is zero' 

  end

  describe '#rgba' do
    it 'should represent pixels as the correct number' 

  end

  describe '#from_hex' do
    it 'should load colors correctly from hex notation' 


    it 'should allow setting opacity explicitly' 

  end

  describe '#from_hsv' do
    it 'should load colors correctly from an HSV triple' 


    it 'should optionally accept a fourth param for alpha' 

  end

  describe '#from_hsl' do
    it 'should load colors correctly from an HSL triple' 


    it 'should optionally accept a fourth param for alpha' 

  end

  describe '#html_color' do
    it 'should find the correct color value' 


    it 'should set the opacity level explicitly' 


    it 'should set opacity levels from the color name' 


    it 'should raise for an unkown color name' 

  end

  describe '#opaque?' do
    it 'should correctly check for opaqueness' 

  end

  describe 'extraction of separate color channels' do
    it 'should extract components from a color correctly' 

  end

  describe '#grayscale_teint' do
    it 'should calculate the correct grayscale teint' 

  end

  describe '#to_grayscale' do
    it 'should use the grayscale teint for r, g and b' 


    it 'should preserve the alpha channel' 

  end

  describe '#to_hex' do
    it 'should represent colors correcly using hex notation' 


    it 'should represent colors correcly using hex notation without alpha channel' 

  end

  describe '#to_hsv' do
    it 'should return a [hue, saturation, value] array' 


    it 'should optionally include the alpha channel' 

  end

  describe '#to_hsl' do
    it 'should return a [hue, saturation, lightness] array' 


    it 'should optionally include the alpha channel in the returned array' 

  end

  describe 'conversion to other formats' do
    it 'should convert the individual color values back correctly' 

  end

  describe '#compose' do

    it 'should use the foregorund color as is when the background color is fully transparent' 


    it 'should use the foregorund color as is when an opaque color is given as foreground color' 


    it 'should use the background color as is when a fully transparent pixel is given as foreground color' 


    it 'should compose pixels correctly with both algorithms' 

  end

  describe '#decompose_alpha' do
    it 'should decompose the alpha channel correctly' 


    it 'should return fully transparent if the background channel matches the resulting color' 


    it 'should return fully opaque if the background channel matches the mask color' 


    it 'should return fully opaque if the resulting color matches the mask color' 

  end

  describe '#blend' do
    it 'should blend colors correctly' 


    it 'should not matter what color is used as foreground, and what as background' 

  end

  describe '#euclidean_distance_rgba' do
    subject { euclidean_distance_rgba(color_a, color_b) }

    context 'with white and black' do
      let(:color_a) { @white }
      let(:color_b) { @black }

      it { should == Math.sqrt(195_075) } # sqrt(255^2 * 3)
    end

    context 'with black and white' do
      let(:color_a) { @black }
      let(:color_b) { @white }

      it { should == Math.sqrt(195_075) } # sqrt(255^2 * 3)
    end

    context 'with the same colors' do
      let(:color_a) { @white }
      let(:color_b) { @white }

      it { should == 0 }
    end
  end
end

