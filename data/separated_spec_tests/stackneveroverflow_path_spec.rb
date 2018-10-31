require 'spec_helper'

describe "load paths: " do
  describe "with a single path" do
    before do
      @env = env_with_path_value File.expand_path('../libjs', __FILE__)
    end
    
    it "finds modules in that path" 


    it "fails when a module is not in the path" 

  end
  
  describe "with multilpe paths" do
    before do
      @env = env_with_path_value [File.expand_path('../libjs2', __FILE__), File.expand_path('../libjs', __FILE__)]
    end
    
    it "finds modules in both paths" 

    
    it "respects the order in which paths were specified" 

  end  
end


