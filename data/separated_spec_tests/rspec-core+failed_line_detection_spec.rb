require 'support/aruba_support'

RSpec.describe 'Failed line detection' do
  include_context "aruba support"
  before { clean_current_dir }

  it "finds the source of a failure in a spec file that is defined at the current directory instead of in the normal `spec` subdir" 
        it 'fails via expect' 

      end
    "

    run_command "the_spec.rb"
    expect(last_cmd_stdout).to include("expect(1).to eq(2)")
  end

  it "finds the source of a failure in a spec file loaded by running `ruby file` rather than loaded directly by RSpec" 
        it 'fails via expect' 

      end
    "

    file = in_current_dir { "#{Dir.pwd}/failing_spec.rb" }
    load file
    run_command "passing_spec.rb"

    expect(last_cmd_stdout).to include("expect(1).to eq(2)")
  end

  it "finds the direct source of failure in any lib, app or spec file, and allows the user to configure what is considered a project source dir" 


  it "finds the callsite of a method provided by a gem that fails (rather than the line in the gem)" 
        it 'fails via assert' 


        it 'fails via expect' 

      end
    "

    run_command ""

    expect(last_cmd_stdout).to include("assert false, 'failed assertion'").
                           and include("expect(1).to eq(2)").
                           and exclude("raise(AssertionFailed, msg)")
  end

  it "falls back to finding a line in a gem when there are no backtrace lines in the app, lib or spec directories" 

end

