require 'spec_helper'

describe Banzai::Filter::ColorFilter, lib: true do
  include FilterSpecHelper

  let(:color) { '#F00' }
  let(:color_chip_selector) { 'code > span.gfm-color_chip > span' }

  ['#123', '#1234', '#123456', '#12345678',
   'rgb(0,0,0)', 'RGB(0, 0, 0)', 'rgba(0,0,0,1)', 'RGBA(0,0,0,0.7)',
   'hsl(270,30%,50%)', 'HSLA(270, 30%, 50%, .7)'].each do |color|
    it "inserts color chip for supported color format #{color}" 

  end

  it 'ignores valid color code without backticks(code tags)' 


  it 'ignores valid color code with prepended space' 


  it 'ignores valid color code with appended space' 


  it 'ignores valid color code surrounded by spaces' 


  it 'ignores invalid color code' 


  def code_tag(string)
    "<code>#{string}</code>"
  end
end

