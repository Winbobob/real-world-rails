require 'rails_helper'
require 'stylesheet/importer'

describe Stylesheet::Importer do

  def compile_css(name)
    Stylesheet::Compiler.compile_asset(name)[0]
  end

  it "applies CDN to background category images" 


  it "applies S3 CDN to background category images" 


end

