RSpec.describe TokenStore::SqlStore do
  around { |example| Timecop.freeze { example.run } }

  describe "#write" do
    it "creates a session" 


    it "updates a session if it exists" 

  end

  describe "#read" do
    it "reads a valid token" 


    it "returns nil for an expired token" 


    it "returns nil if no token can be found" 

  end

  describe "#delete" do
    it "deletes a token" 

  end

  def build_sql_store(namespace = "FOO")
    described_class.new(:namespace => namespace)
  end
end

