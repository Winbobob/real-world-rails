require 'spec_helper'

describe Banzai::Filter::ImageLinkFilter do
  include FilterSpecHelper

  def image(path)
    %(<img src="#{path}" />)
  end

  it 'wraps the image with a link to the image src' 


  it 'does not wrap a duplicate link' 


  it 'works with external images' 


  it 'works with inline images' 

end

