require 'spec_helper'

describe Banzai::Filter::EmojiFilter do
  include FilterSpecHelper

  it 'replaces supported name emoji' 


  it 'replaces supported unicode emoji' 


  it 'ignores unsupported emoji' 


  it 'correctly encodes the URL' 


  it 'correctly encodes unicode to the URL' 


  it 'matches at the start of a string' 


  it 'unicode matches at the start of a string' 


  it 'matches at the end of a string' 


  it 'unicode matches at the end of a string' 


  it 'matches with adjacent text' 


  it 'unicode matches with adjacent text' 


  it 'does not match multiple emoji in a row' 


  it 'unicode matches multiple emoji in a row' 


  it 'mixed matches multiple emoji in a row' 


  it 'does not match emoji in a string' 


  it 'has a data-name attribute' 


  it 'has a data-unicode-version attribute' 


  it 'keeps whitespace intact' 


  it 'unicode keeps whitespace intact' 

end

