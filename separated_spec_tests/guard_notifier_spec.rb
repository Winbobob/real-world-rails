require "guard/compat/test/helper"

require "guard/rspec/notifier"

RSpec.describe Guard::RSpec::Notifier do
  let(:options) { { notification: true, title: "RSpec results" } }
  let(:notifier) { Guard::RSpec::Notifier.new(options) }

  def expect_notification(message, image, priority, title = "RSpec results")
    expect(Guard::Compat::UI).to receive(:notify).
      with(message,  title: title, image: image, priority: priority)
  end

  describe "#notify_failure" do
    it "notifies about failure" 


    context "with a custom title" do
      let(:options) { { notification: true, title: "Failure title" } }

      it "notifies with the title" 

    end
  end

  describe "#notify" do
    it "notifies about success" 


    context "with pendings" do
      let(:summary) { "5 examples, 0 failures (1 pending) in 4.0000 seconds" }

      it "notifies about pendings" 

    end

    context "with failures" do
      let(:summary) { "5 examples, 1 failures in 4.0000 seconds" }

      it "notifies about failures" 


      context "even if there is pendings" do
        let(:summary) { "5 examples, 1 failures (1 pending) in 4.0000 seconds" }

        it "still notifies about failures" 

      end
    end

    context "with a custom title" do
      let(:options) { { notification: true, title: "Custom title" } }

      it "notifies with the title" 

    end
  end

  context "with notifications turned off" do
    let(:options) { { notification: false } }

    describe "#notify_failure" do
      it "keeps quiet" 

    end

    describe "#notify" do
      it "keeps quiet" 

    end
  end
end

