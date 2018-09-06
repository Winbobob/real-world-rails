require 'rails_helper'
require 'stylesheet/compiler'

describe Stylesheet::Compiler do
  describe 'compilation' do
    Dir["#{Rails.root.join("app/assets/stylesheets")}/*.scss"].each do |path|
      path = File.basename(path, '.scss')

      it "can compile '#{path}' css" 

    end
  end

  it "supports asset-url" 


  it "supports image-url" 

end

