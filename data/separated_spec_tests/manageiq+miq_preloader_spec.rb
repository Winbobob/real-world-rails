describe MiqPreloader do
  describe ".preload" do
    it "preloads once from an object" 


    it "preloads from an array" 


    it "preloads from an association" 


    def preload(*args)
      MiqPreloader.preload(*args)
    end
  end

  describe ".preload_and_map" do
    it "preloads from an object" 


    it "preloads from an association" 


    def preload_and_map(*args)
      MiqPreloader.preload_and_map(*args)
    end
  end

  describe ".preload_and_scope" do
    it "preloads (object).has_many" 


    it "preloads (object.all).has_many" 


    it "respects scopes (object.all).has_many {with scope}" 


    it "preloads (object.all).has_many.belongs_to" 


    it "preloads (object.all).belongs_to.has_many" 


    def preload_and_scope(*args)
      MiqPreloader.preload_and_scope(*args)
    end
  end
end

