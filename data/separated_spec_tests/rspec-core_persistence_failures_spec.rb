require 'support/aruba_support'

RSpec.describe 'Persistence failures' do
  include_context "aruba support"
  before { clean_current_dir }

  context "when `config.example_status_persistence_file_path` is configured" do
    context "to an invalid file path (e.g. spec/spec_helper.rb/examples.txt)" do
      before do
        write_file_formatted "spec/1_spec.rb", "
          RSpec.configure do |c|
            c.example_status_persistence_file_path = 'spec/1_spec.rb/examples.txt'
          end
          RSpec.describe { example { } }
        "
      end

      it 'emits a helpful warning to the user, indicating we cannot write to it, and still runs the spec suite' 

    end

    context "to a file path for which we lack permissions" do
      before do
        write_file_formatted "spec/1_spec.rb", "
          RSpec.configure do |c|
            c.example_status_persistence_file_path = 'spec/examples.txt'
          end
          RSpec.describe { example { } }
        "

        write_file_formatted "spec/examples.txt", ""
        in_current_dir do
          FileUtils.chmod 0000, "spec/examples.txt"
        end
      end


      it 'emits a helpful warning to the user, indicating we cannot read from it, and still runs the spec suite' 

    end
  end
end

