describe "a generated attributes hash" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User")
    define_model("Comment")

    define_model("Post", title:   :string,
                         body:    :string,
                         summary: :string,
                         user_id: :integer) do
      belongs_to :user
      has_many :comments
    end

    FactoryBot.define do
      factory :user
      factory :comment

      factory :post do
        title { "default title" }
        body { "default body" }
        summary { title }
        user
        comments do |c|
          [c.association(:comment)]
        end
      end
    end
  end

  subject { attributes_for(:post, title: "overridden title") }

  it "assigns an overridden value" 


  it "assigns a default value" 


  it "assigns a lazy, dependent attribute" 


  it "doesn't assign associations" 

end

describe "calling `attributes_for` with a block" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("Company", name: :string)

    FactoryBot.define do
      factory :company
    end
  end

  it "passes the hash of attributes" 


  it "returns the hash of attributes" 

end

describe "`attributes_for` for a class whose constructor has required params" do
  before do
    define_model("User", name: :string) do
      def initialize(arg1, arg2); end
    end

    FactoryBot.define do
      factory :user do
        name { "John Doe" }
      end
    end
  end

  subject      { FactoryBot.attributes_for(:user) }
  its([:name]) { should eq "John Doe" }
end

