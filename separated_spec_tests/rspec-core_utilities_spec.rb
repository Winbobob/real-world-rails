require 'rspec/core/bisect/utilities'

module RSpec::Core
  RSpec.describe Bisect::Notifier do
    class ExampleFormatterClass
      def foo(notification); end
    end

    let(:formatter) { instance_spy(ExampleFormatterClass) }
    let(:notifier) { Bisect::Notifier.new(formatter) }

    it 'publishes events to the wrapped formatter' 


    it 'does not publish events the formatter does not recognize' 

  end

  RSpec.describe Bisect::Channel do
    include RSpec::Support::InSubProcess

    it "supports sending objects from a child process back to the parent" 

  end
end

