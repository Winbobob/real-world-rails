require 'spec_helper'

describe Banzai::Filter::MathFilter do
  include FilterSpecHelper

  it 'leaves regular inline code unchanged' 


  it 'removes surrounding dollar signs and adds class code, math and js-render-math' 


  it 'only removes surrounding dollar signs' 


  it 'only removes surrounding single dollar sign' 


  it 'adds data-math-style inline attribute to inline math' 


  it 'adds class code and math to inline math' 


  it 'adds js-render-math class to inline math' 


  # Cases with faulty syntax. Should be a no-op

  it 'ignores cases with missing dolar sign at the end' 


  it 'ignores cases with missing dolar sign at the beginning' 


  it 'ignores dollar signs if it is not adjacent' 


  it 'ignores dollar signs if they are inside another element' 


  # Display math

  it 'adds data-math-style display attribute to display math' 


  it 'adds js-render-math class to display math' 


  it 'ignores code blocks that are not math' 


  it 'requires the pre to contain both code and math' 


  it 'dollar signs around to display math' 

end

