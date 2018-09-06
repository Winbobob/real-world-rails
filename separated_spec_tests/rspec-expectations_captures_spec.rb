RSpec.describe "expect(regex).to match(string).with_captures" do
  context "with a string target" do
    it "does match a regex with a missing capture" 


    it "does not match a regex with an incorrect match" 


    it "matches a regex without named captures" 


    it "uses the match description if the regex doesn't match" 


    if RUBY_VERSION != "1.8.7"
      it "matches a regex with named captures" 


      it "matches a regex with a nested matcher" 


      it "does not match a regex with an incorrect named group match" 


      it "has a sensible failure description with a hash including matcher" 


      it "matches named captures when not passing a hash" 

    end
  end

  context "with a regex target" do
    it "does match a regex with a missing capture" 


    it "does not match a regex with an incorrect match" 


    it "matches a regex without named captures" 


    it "uses the match description if the regex doesn't match" 


    if RUBY_VERSION != "1.8.7"
      it "matches a regex with named captures" 


      it "matches a regex with a nested matcher" 


      it "does not match a regex with an incorrect named group match" 


      it "has a sensible failure description with a hash including matcher" 


      it "matches named captures when not passing a hash" 

    end
  end
end

