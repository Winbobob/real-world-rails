require 'spec_helper'

describe Banzai::Filter::ImageLazyLoadFilter, lib: true do
  include FilterSpecHelper

  def image(path)
    %(<img src="#{path}" />)
  end

  it 'transforms the image src to a data-src' 


  it 'works with external images' 

end

