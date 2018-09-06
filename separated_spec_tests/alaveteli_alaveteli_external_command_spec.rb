# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'alaveteli_external_command'

script_dir = File.join(File.dirname(__FILE__), 'alaveteli_external_command_scripts')
segfault_script = File.join(script_dir, 'segfault.sh')
error_script = File.join(script_dir, 'error.sh')

describe "when running external commands" do

  it "should detect a non-zero exit status" 


  it "should detect when an external command crashes" 


end

