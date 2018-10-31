require 'spec_helper'

describe Ansi2html do

  it "prints non-ansi as-is" 


  it "strips non-color-changing controll sequences" 


  it "prints simply red" 


  it "prints simply red without trailing reset" 


  it "prints simply yellow" 


  it "prints default on blue" 


  it "prints red on blue" 


  it "resets colors after red on blue" 


  it "performs color change from red/blue to yellow/blue" 


  it "performs color change from red/blue to yellow/green" 


  it "performs color change from red/blue to reset to yellow/green" 


  it "ignores unsupported codes" 


  it "prints light red" 


  it "prints default on light red" 


  it "performs color change from red/blue to default/blue" 


  it "performs color change from light red/blue to default/blue" 


  it "prints bold text" 


  it "resets bold text" 


  it "prints italic text" 


  it "resets italic text" 


  it "prints underlined text" 


  it "resets underlined text" 


  it "prints concealed text" 


  it "resets concealed text" 


  it "prints crossed-out text" 


  it "resets crossed-out text" 


  it "can print 256 xterm fg colors" 


  it "can print 256 xterm fg colors on normal magenta background" 


  it "can print 256 xterm bg colors" 


  it "can print 256 xterm bg colors on normal magenta foreground" 


  it "prints bold colored text vividly" 


  it "prints bold light colored text correctly" 

end

