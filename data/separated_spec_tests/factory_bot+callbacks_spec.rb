describe "callbacks" do
  before do
    define_model("User", first_name: :string, last_name: :string)

    FactoryBot.define do
      factory :user_with_callbacks, class: :user do
        after(:stub)   { |user| user.first_name = "Stubby" }
        after(:build)  { |user| user.first_name = "Buildy" }
        after(:create) { |user| user.last_name  = "Createy" }
      end

      factory :user_with_inherited_callbacks, parent: :user_with_callbacks do
        after(:stub)  { |user| user.last_name  = "Double-Stubby" }
        after(:build) { |user| user.first_name = "Child-Buildy" }
      end
    end
  end

  it "runs the after(:stub) callback when stubbing" 


  it "runs the after(:build) callback when building" 


  it "runs both the after(:build) and after(:create) callbacks when creating" 


  it "runs both the after(:stub) callback on the factory and the inherited after(:stub) callback" 


  it "runs child callback after parent callback" 

end

describe "callbacks using Symbol#to_proc" do
  before do
    define_model("User") do
      def confirmed?
        !!@confirmed
      end

      def confirm!
        @confirmed = true
      end
    end

    FactoryBot.define do
      factory :user do
        after :build, &:confirm!
      end
    end
  end

  it "runs the callback correctly" 

end

describe "callbacks using syntax methods without referencing FactoryBot explicitly" do
  before do
    define_model("User", first_number: :integer, last_number: :integer)

    FactoryBot.define do
      sequence(:sequence_1)
      sequence(:sequence_2)
      sequence(:sequence_3)

      factory :user do
        after(:stub)   { generate(:sequence_3) }
        after(:build)  { |user| user.first_number = generate(:sequence_1) }
        after(:create) { |user, _evaluator| user.last_number = generate(:sequence_2) }
      end
    end
  end

  it "works when the callback has no variables" 


  it "works when the callback has one variable" 


  it "works when the callback has two variables" 

end

describe "custom callbacks" do
  let(:custom_before) do
    Class.new do
      def result(evaluation)
        evaluation.object.tap do |instance|
          evaluation.notify(:before_custom, instance)
        end
      end
    end
  end

  let(:custom_after) do
    Class.new do
      def result(evaluation)
        evaluation.object.tap do |instance|
          evaluation.notify(:after_custom, instance)
        end
      end
    end
  end

  let(:totally_custom) do
    Class.new do
      def result(evaluation)
        evaluation.object.tap do |instance|
          evaluation.notify(:totally_custom, instance)
        end
      end
    end
  end

  before do
    define_model("User", first_name: :string, last_name: :string) do
      def name
        [first_name, last_name].join(" ")
      end
    end

    FactoryBot.register_strategy(:custom_before, custom_before)
    FactoryBot.register_strategy(:custom_after, custom_after)
    FactoryBot.register_strategy(:totally_custom, totally_custom)

    FactoryBot.define do
      factory :user do
        first_name { "John" }
        last_name  { "Doe" }

        before(:custom) { |instance| instance.first_name = "Overridden First" }
        after(:custom)  { |instance| instance.last_name  = "Overridden Last" }
        callback(:totally_custom) do |instance|
          instance.first_name = "Totally"
          instance.last_name  = "Custom"
        end
      end
    end
  end

  it "runs a custom before callback when the proper strategy executes" 


  it "runs a custom after callback when the proper strategy executes" 


  it "runs a custom callback without prepending before or after when the proper strategy executes" 

end

describe "binding a callback to multiple callbacks" do
  before do
    define_model("User", name: :string)

    FactoryBot.define do
      factory :user do
        callback(:before_create, :after_stub) do |instance|
          instance.name = instance.name.upcase
        end
      end
    end
  end

  it "binds the callback to creation" 


  it "does not bind the callback to building" 


  it "binds the callback to stubbing" 

end

describe "global callbacks" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User", name: :string)
    define_model("Company", name: :string)

    FactoryBot.define do
      after :build do |object|
        object.name = case object.class.to_s
                      when "User" then "John Doe"
                      when "Company" then "Acme Suppliers"
                      end
      end

      after :create do |object|
        object.name = "#{object.name}!!!"
      end

      trait :awesome do
        after :build do |object|
          object.name = "___#{object.name}___"
        end

        after :create do |object|
          object.name = "A#{object.name}Z"
        end
      end

      factory :user do
        after :build do |user|
          user.name = user.name.downcase
        end
      end

      factory :company do
        after :build do |company|
          company.name = company.name.upcase
        end
      end
    end
  end

  it "triggers after build callbacks for all factories" 

end

