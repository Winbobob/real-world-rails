require 'support/aruba_support'

RSpec.describe 'Filtering' do
  include_context "aruba support"
  before { clean_current_dir }

  it 'prints a rerun command for shared examples in external files that works to rerun' 


  def run_rerun_command_for_failing_spec
    command = last_cmd_stdout[/Failed examples:\s+rspec (\S+) #/, 1]
    run_command command
  end

  context "with a shared example containing a context in a separate file" do
    it "runs the example nested inside the shared" 
          it 'succeeds' 


          context 'with a nested context' do
            it 'succeeds (nested)' 

          end
        end
      "

      write_file_formatted 'spec/simple_spec.rb', "
        require File.join(File.dirname(__FILE__), 'shared_example.rb')

        RSpec.describe 'top level' do
          it_behaves_like 'a shared example'
        end
      "

      run_command 'spec/simple_spec.rb:3 -fd'
      expect(last_cmd_stdout).to match(/2 examples, 0 failures/)
    end
  end

  context "passing a line-number filter" do
    it "trumps exclusions, except for :if/:unless (which are absolute exclusions)" 


    it 'works correctly when line numbers align with a shared example group line number from another file' 

  end

  context "passing a line-number-filtered file and a non-filtered file" do
    it "applies the line number filtering only to the filtered file, running all specs in the non-filtered file except excluded ones" 


    it 'applies command line tag filters only to files that lack a line number filter' 

  end

  context "passing example ids at the command line" do
    it "selects matching examples" 


    it "selects matching example groups" 

  end

  context "with `filter_run_when_matching`" do
    it "filters to matching examples" 
          it 'passes' 

        end

        RSpec.describe 'An unmatching group' do
          it 'passes', :some_tag do
          end

          it 'fails' 

        end
      "

      run_command ""
      expect(last_cmd_stdout).to include("2 examples, 0 failures")
    end

    it "is ignored when no examples match the provided filter" 
          it 'is still run' 

        end
      "

      run_command ""
      expect(last_cmd_stdout).to include("1 example, 0 failures")
    end
  end
end

