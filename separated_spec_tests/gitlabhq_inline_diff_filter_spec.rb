require 'spec_helper'

describe Banzai::Filter::InlineDiffFilter do
  include FilterSpecHelper

  it 'adds inline diff span tags for deletions when using square brackets' 


  it 'adds inline diff span tags for deletions when using curley braces' 


  it 'does not add inline diff span tags when a closing tag is not provided' 


  it 'adds inline span tags for additions when using square brackets' 


  it 'adds inline span tags for additions  when using curley braces' 


  it 'does not add inline diff span tags when a closing addition tag is not provided' 


  it 'does not add inline diff span tags when the tags do not match' 


  it 'prevents user-land html being injected' 


  it 'preserves content inside pre tags' 


  it 'preserves content inside code tags' 


  it 'preserves content inside tt tags' 

end

