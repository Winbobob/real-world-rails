RSpec.describe Celluloid::Internals::Registry, actor_system: :global do
  class Marilyn
    include Celluloid

    def sing_for(person)
      "o/~ Happy birthday, #{person}"
    end
  end

  it "registers Actors" 


  it "refuses to register non-Actors" 


  it "lists all registered actors" 


  it "knows its name once registered" 


  describe :delete do
    before do
      Celluloid::Actor[:marilyn] ||= Marilyn.new
    end

    it "removes reference to actors' name from the registry" 


    it "returns actor removed from the registry" 

  end

  describe :clear do
    it "should return a hash of registered actors and remove them from the registry" 

  end
end

