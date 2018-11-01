describe "initialize_with with non-FG attributes" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User", name: :string, age: :integer) do
      def self.construct(name, age)
        new(name: name, age: age)
      end
    end

    FactoryBot.define do
      factory :user do
        initialize_with { User.construct("John Doe", 21) }
      end
    end
  end

  subject    { build(:user) }
  its(:name) { should eq "John Doe" }
  its(:age)  { should eq 21 }
end

describe "initialize_with with FG attributes that are transient" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User", name: :string) do
      def self.construct(name)
        new(name: "#{name} from .construct")
      end
    end

    FactoryBot.define do
      factory :user do
        transient do
          name { "Handsome Chap" }
        end

        initialize_with { User.construct(name) }
      end
    end
  end

  subject    { build(:user) }
  its(:name) { should eq "Handsome Chap from .construct" }
end

describe "initialize_with non-ORM-backed objects" do
  include FactoryBot::Syntax::Methods

  before do
    define_class("ReportGenerator") do
      attr_reader :name, :data

      def initialize(name, data)
        @name = name
        @data = data
      end
    end

    FactoryBot.define do
      sequence(:random_data) { Array.new(5) { Kernel.rand(200) } }

      factory :report_generator do
        transient do
          name { "My Awesome Report" }
        end

        initialize_with { ReportGenerator.new(name, FactoryBot.generate(:random_data)) }
      end
    end
  end

  it "allows for overrides" 


  it "generates random data" 

end

describe "initialize_with parent and child factories" do
  before do
    define_class("Awesome") do
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    FactoryBot.define do
      factory :awesome do
        transient do
          name { "Great" }
        end

        initialize_with { Awesome.new(name) }

        factory :sub_awesome do
          transient do
            name { "Sub" }
          end
        end

        factory :super_awesome do
          initialize_with { Awesome.new("Super") }
        end
      end
    end
  end

  it "uses the parent's constructor when the child factory doesn't assign it" 


  it "allows child factories to override initialize_with" 

end

describe "initialize_with implicit constructor" do
  before do
    define_class("Awesome") do
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    FactoryBot.define do
      factory :awesome do
        transient do
          name { "Great" }
        end

        initialize_with { new(name) }
      end
    end
  end

  it "instantiates the correct object" 

end

describe "initialize_with doesn't duplicate assignment on attributes accessed from initialize_with" do
  before do
    define_class("User") do
      attr_reader :name
      attr_accessor :email

      def initialize(name)
        @name = name
      end
    end

    FactoryBot.define do
      sequence(:email) { |n| "person#{n}@example.com" }

      factory :user do
        email

        name { email.gsub(/\@.+/, "") }

        initialize_with { new(name) }
      end
    end
  end

  it "instantiates the correct object" 

end

describe "initialize_with has access to all attributes for construction" do
  it "assigns attributes correctly" 

end

describe "initialize_with with an 'attributes' attribute" do
  it "assigns attributes correctly" 

end

describe "initialize_with for a constructor that requires a block" do
  it "executes the block correctly" 

end

