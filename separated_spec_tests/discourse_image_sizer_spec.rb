require 'rails_helper'
require 'image_sizer'

describe ImageSizer do

  before do
    SiteSetting.max_image_width = 500
    SiteSetting.max_image_height = 500
  end

  it 'returns the same dimensions when smaller than the maximums' 


  it 'returns nil if the width is nil' 


  it 'returns nil if the height is nil' 


  it 'works with string parameters' 


  describe 'when larger than the maximum width' do

    before do
      @w, @h = ImageSizer.resize(600, 123)
    end

    it 'returns the maxmimum width if larger than the maximum' 


    it 'resizes the height retaining the aspect ratio' 


  end

  describe 'when larger than the maximum height' do

    before do
      @w, @h = ImageSizer.resize(123, 600)
    end

    it 'returns the maxmimum height if larger than the maximum' 


    it 'resizes the width retaining the aspect ratio' 


  end

  describe 'when larger than the maximums' do

    before do
      @w, @h = ImageSizer.resize(533, 800)
    end

    it 'resizes both dimensions retaining the aspect ratio' 


  end

end

