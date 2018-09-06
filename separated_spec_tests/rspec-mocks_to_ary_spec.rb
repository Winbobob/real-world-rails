RSpec.describe "a double receiving to_ary" do
  shared_examples "to_ary" do
    it "can be overridden with a stub" 


    it "responds when overridden" 


    it "supports Array#flatten" 

  end

  context "double as_null_object" do
    let(:obj) { double('obj').as_null_object }
    include_examples "to_ary"

    it "does respond to to_ary" 


    it "does respond to to_a" 


    it "returns nil" 

  end

  context "double without as_null_object" do
    let(:obj) { double('obj') }
    include_examples "to_ary"

    it "doesn't respond to to_ary" 


    it "doesn't respond to to_a", :if => (RUBY_VERSION.to_f > 1.8) do
      expect(obj).not_to respond_to(:to_a)
    end

    it "raises " 

  end
end

