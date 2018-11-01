describe "build multiple instances" do
  before do
    define_model("Post", title: :string, position: :integer)

    FactoryBot.define do
      factory(:post) do |post|
        post.title { "Through the Looking Glass" }
        post.position { rand(10**4) }
      end
    end
  end

  context "without default attributes" do
    subject { FactoryBot.build_list(:post, 20) }

    its(:length) { should eq 20 }

    it "builds (but doesn't save) all the posts" 


    it "uses the default factory values" 

  end

  context "with default attributes" do
    subject { FactoryBot.build_list(:post, 20, title: "The Hunting of the Snark") }

    it "overrides the default values" 

  end

  context "with a block" do
    subject do
      FactoryBot.build_list(:post, 20, title: "The Listing of the Block") do |post|
        post.position = post.id
      end
    end

    it "correctly uses the set value" 

  end
end
