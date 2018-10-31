require "spec_helper"

describe HasSubscribers do
  before { enable_has_subscribers }
  after { disable_has_subscribers }

  # Comment uses notifies_subscribers_of and include_owner: true
  it "notifies subscribers and owners" 


  it "does not notify subscribers with suspended subscriptions" 


  describe "notify_subscribers_of" do
    it "skips subscribables that do not include HasSubscribers" 

  end

end

