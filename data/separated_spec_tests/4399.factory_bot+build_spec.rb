describe "a built instance" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User")

    define_model("Post", user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user

      factory :post do
        user
      end
    end
  end

  subject { build(:post) }

  it { should be_new_record }

  context "when the :use_parent_strategy config option has not been set" do
    before { FactoryBot.use_parent_strategy = nil }

    it "assigns and saves associations" 

  end

  context "when the :use_parent_strategy config option has been enabled" do
    before { FactoryBot.use_parent_strategy = true }

    it "assigns but does not save associations" 

  end

  it "assigns but does not save associations when using parent strategy" 

end

describe "a built instance with strategy: :create" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User")

    define_model("Post", user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user

      factory :post do
        association(:user, strategy: :create)
      end
    end
  end

  subject { build(:post) }

  it { should be_new_record }

  it "assigns and saves associations" 

end

describe "calling `build` with a block" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("Company", name: :string)

    FactoryBot.define do
      factory :company
    end
  end

  it "passes the built instance" 


  it "returns the built instance" 

end

