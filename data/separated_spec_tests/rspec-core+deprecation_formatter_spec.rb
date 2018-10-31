require 'rspec/core/reporter'
require 'rspec/core/formatters/deprecation_formatter'
require 'tempfile'

module RSpec::Core::Formatters
  RSpec.describe DeprecationFormatter do
    include FormatterSupport

    let(:summary_stream) { StringIO.new }

    def notification(hash)
      ::RSpec::Core::Notifications::DeprecationNotification.from_hash(hash)
    end

    before do
      setup_reporter deprecation_stream, summary_stream
    end

    describe "#deprecation" do

      context "with a File deprecation_stream", :slow do
        let(:deprecation_stream) { File.open("#{Dir.tmpdir}/deprecation_summary_example_output", "w+") }

        it "prints a message if provided, ignoring other data" 


        it "surrounds multiline messages in fenceposts" 


        it "includes the method" 


        it "includes the replacement" 


        it "includes the call site if provided" 

      end

      context "with an IO deprecation stream" do
        let(:deprecation_stream) { StringIO.new }

        it "prints nothing" 

      end
    end

    describe "#deprecation_summary" do
      let(:summary)   { double }

      context "with a File deprecation_stream", :slow do
        let(:deprecation_stream) { File.open("#{Dir.tmpdir}/deprecation_summary_example_output", "w") }

        it "prints a count of the deprecations" 


        it "pluralizes the reported deprecation count for more than one deprecation" 


        it "is not printed when there are no deprecations" 


        it 'uses synchronized/non-buffered output to work around odd duplicate output behavior we have observed' 


        it 'does not print duplicate messages' 


        it "can handle when the stream is reopened to a system stream", :unless => RSpec::Support::OS.windows? do
          send_notification :deprecation, notification(:deprecated => 'foo')
          deprecation_stream.reopen(IO.for_fd(IO.sysopen('/dev/null', "w+")))
          send_notification :deprecation_summary, null_notification
        end
      end

      context "with an Error deprecation_stream" do
        let(:deprecation_stream) { DeprecationFormatter::RaiseErrorStream.new }

        it 'prints a summary of the number of deprecations found' 


        it 'pluralizes the count when it is greater than 1' 

      end

      context "with an IO deprecation_stream" do
        let(:deprecation_stream) { StringIO.new }

        it "groups similar deprecations together" 


        it "limits the deprecation warnings after 3 calls" 


        it "limits :message deprecation warnings with different callsites after 3 calls" 


        it "prints the true deprecation count to the summary_stream" 


        it 'does not print duplicate messages' 

      end
    end
  end
end

