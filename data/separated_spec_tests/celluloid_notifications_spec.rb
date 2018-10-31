RSpec.describe Celluloid::Notifications, actor_system: :global do
  class Admirer
    include Celluloid
    include Celluloid::Notifications

    attr_reader :mourning
    attr_reader :mourning_count

    def someone_died(_topic, name)
      @mourning = name
      @mourning_count ||= 0
      @mourning_count += 1
    end
  end

  class President
    include Celluloid
    include Celluloid::Notifications

    def die(topic = "death")
      publish(topic, "Mr. President")
    end
  end

  it "notifies relevant subscribers" 


  it "allows multiple subscriptions from the same actor" 


  it "notifies subscribers" 


  it "publishes even if there are no subscribers" 


  it "allows symbol subscriptions" 


  it "allows regex subscriptions" 


  it "matches symbols against regex subscriptions" 


  it "allows unsubscribing" 


  it "prunes dead subscriptions" 


  it "prunes multiple subscriptions from a dead actor" 

end

