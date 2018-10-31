require 'spec_helper'

describe Banzai::Filter::ImageLazyLoadFilter do
  include FilterSpecHelper

  def image(path)
    %(<img src="#{path}" />)
  end

  def image_with_class(path, class_attr = nil)
    %(<img src="#{path}" class="#{class_attr}"/>)
  end

  it 'adds a class attribute' 


  it 'appends to the current class attribute' 


  it 'transforms the image src to a data-src' 


  it 'works with external images' 

end

