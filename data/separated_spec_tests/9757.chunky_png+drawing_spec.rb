require 'spec_helper'

describe ChunkyPNG::Canvas::Drawing do

  describe '#compose_pixel' do
    subject { ChunkyPNG::Canvas.new(1, 1, ChunkyPNG::Color.rgb(200, 150, 100)) }

    it "should compose colors correctly" 


    it "should return the composed color" 


    it "should do nothing when the coordinates are out of bounds" 

  end

  describe '#line' do
    it "should draw lines correctly with anti-aliasing" 


    it "should draw partial lines if the coordinates are partially out of bounds" 


    it "should return itself to allow chaining" 

  end

  describe '#rect' do
    subject { ChunkyPNG::Canvas.new(16, 16, '#ffffff') }

    it "should draw a rectangle with the correct colors" 


    it "should return itself to allow chaining" 


    it "should draw partial rectangles if the coordinates are partially out of bounds" 


    it "should draw the rectangle fill only if the coordinates are fully out of bounds" 

  end

  describe '#circle' do
    subject { ChunkyPNG::Canvas.new(32, 32, ChunkyPNG::Color.rgba(0, 0, 255, 128)) }

    it "should draw circles" 


    it "should draw partial circles when going of the canvas bounds" 


    it "should return itself to allow chaining" 

  end

  describe '#polygon' do
    subject { ChunkyPNG::Canvas.new(22, 22) }

    it "should draw an filled triangle when using 3 control points" 


    it "should draw a unfilled polygon with 6 control points" 


    it "should draw a vertically crossed filled polygon with 4 control points" 


    it "should draw a vertically crossed filled polygon with 4 control points" 


    it "should return itself to allow chaining" 

  end

  describe '#bezier_curve' do
    subject { ChunkyPNG::Canvas.new(24, 24, ChunkyPNG::Color::WHITE) }

    it "should draw a bezier curve starting at the first point" 


    it "should draw a bezier curve ending at the last point" 


    it "should draw a bezier curve with a color of green" 


    it "should draw a three point bezier curve" 


    it "should draw a three point bezier curve flipped" 


    it "should draw a four point bezier curve" 


    it "should draw a four point bezier curve flipped" 


    it "should draw a four point bezier curve with a shape of an s" 


    it "should draw a five point bezier curve" 


    it "should draw a six point bezier curve" 

  end
end

