require 'spec_helper'

describe Spork::Diagnoser do
  after(:each) do
    Spork::Diagnoser.remove_hook!
    Spork::Diagnoser.loaded_files.clear
  end
  
  def run_simulation(directory, filename = nil, contents = nil, &block)
    FileUtils.mkdir_p(directory)
    Dir.chdir(directory) do
      if filename
        File.open(filename, 'wb') { |f| f << contents }
        Spork::Diagnoser.install_hook!
        require "./#{filename}"
      end
      yield if block_given?
    end
  end
  
  it "installs it's hook and tells you when files have been loaded" 


  it 'excludes files outside of Dir.pwd' 

  
  it "excludes files outside of Dir.pwd but in ruby's include path" 

  
  it "expands files to their fully their fully qualified path" 

  
  it "can tell the difference between a folder in the project path and a file in an external path" 

  
  it "filters backtrace beyond the last line matching the entry point" 

  
  describe ".output_results" do
    it "outputs the results relative to the current directory" 

  end
end

