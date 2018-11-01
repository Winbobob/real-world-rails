RSpec.describe Celluloid::Mailbox::Evented do
  subject { TestEventedMailbox.new }
  it_behaves_like "a Celluloid Mailbox"

  it "recovers from timeout exceeded to process mailbox message" 


  it "discard messages when reactor wakeup fails" 

end

