require 'spec_helper'
require 'rainbow'

RSpec.describe 'Rainbow() wrapper' do
  before do
    Rainbow.enabled = true
  end

  it 'allows foreground coloring by color number' 


  it 'allows foreground coloring by color name' 


  it 'allows foreground coloring directly by ANSI method name' 


  it 'allows foreground coloring directly by X11 method name' 


  it 'allows foreground coloring by ANSI color name (color alias)' 


  it 'allows foreground coloring by color name (colour alias)' 


  it 'allows foreground coloring by X11 color name' 


  it 'allows foreground coloring by color rgb' 


  it 'allows foreground coloring by color rgb (hex string)' 


  it 'allows background coloring by color number' 


  it 'allows background coloring by ANSI color name' 


  it 'allows background coloring by X11 color name' 


  it 'allows background coloring by color rgb' 


  it 'allows making text bright' 


  it 'allows making text faint' 


  it 'allows making text italic' 


  it 'allows making text underlined' 


  it 'allows making text blinking' 


  it 'allows making text inversed' 


  it 'allows making text hidden' 


  it 'allows resetting all the attributes' 


  it 'allows chaining' 


  context "when Rainbow is disabled" do
    before do
      Rainbow.enabled = false
    end

    it "allows chaining but doesn't wrap with escape codes" 

  end
end

