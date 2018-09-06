require 'rails_helper'
require 'global_path'

class GlobalPathInstance
  extend GlobalPath
end

describe GlobalPath do

  context 'cdn_relative_path' do
    def cdn_relative_path(p)
      GlobalPathInstance.cdn_relative_path(p)
    end

    it "just returns path for no cdn" 


    it "returns path when a cdn is defined with a path" 


    it "returns path when a cdn is defined with a path" 


  end
end

