require "spec_helper"

describe "an instance generated by a factory with multiple traits" do
  before do
    define_model("User",
                 name:          :string,
                 admin:         :boolean,
                 gender:        :string,
                 email:         :string,
                 date_of_birth: :date,
                 great:         :string)

    FactoryBot.define do
      factory :user_without_admin_scoping, class: User do
        admin_trait
      end

      factory :user do
        name "John"

        trait :great do
          great "GREAT!!!"
        end

        trait :admin do
          admin true
        end

        trait :admin_trait do
          admin true
        end

        trait :male do
          name   "Joe"
          gender "Male"
        end

        trait :female do
          name   "Jane"
          gender "Female"
        end

        factory :great_user do
          great
        end

        factory :admin, traits: [:admin]

        factory :male_user do
          male

          factory :child_male_user do
            date_of_birth { Date.parse("1/1/2000") }
          end
        end

        factory :female, traits: [:female] do
          trait :admin do
            admin true
            name "Judy"
          end

          factory :female_great_user do
            great
          end

          factory :female_admin_judy, traits: [:admin]
        end

        factory :female_admin,            traits: [:female, :admin]
        factory :female_after_male_admin, traits: [:male, :female, :admin]
        factory :male_after_female_admin, traits: [:female, :male, :admin]
      end

      trait :email do
        email { "#{name}@example.com" }
      end

      factory :user_with_email, class: User, traits: [:email] do
        name "Bill"
      end
    end
  end

  context "the parent class" do
    subject      { FactoryBot.create(:user) }
    its(:name)   { should eq "John" }
    its(:gender) { should be_nil }
    it           { should_not be_admin }
  end

  context "the child class with one trait" do
    subject      { FactoryBot.create(:admin) }
    its(:name)   { should eq "John" }
    its(:gender) { should be_nil }
    it           { should be_admin }
  end

  context "the other child class with one trait" do
    subject      { FactoryBot.create(:female) }
    its(:name)   { should eq "Jane" }
    its(:gender) { should eq "Female" }
    it           { should_not be_admin }
  end

  context "the child with multiple traits" do
    subject      { FactoryBot.create(:female_admin) }
    its(:name)   { should eq "Jane" }
    its(:gender) { should eq "Female" }
    it           { should be_admin }
  end

  context "the child with multiple traits and overridden attributes" do
    subject      { FactoryBot.create(:female_admin, name: "Jill", gender: nil) }
    its(:name)   { should eq "Jill" }
    its(:gender) { should be_nil }
    it           { should be_admin }
  end

  context "the child with multiple traits who override the same attribute" do
    context "when the male assigns name after female" do
      subject      { FactoryBot.create(:male_after_female_admin) }
      its(:name)   { should eq "Joe" }
      its(:gender) { should eq "Male" }
      it           { should be_admin }
    end

    context "when the female assigns name after male" do
      subject      { FactoryBot.create(:female_after_male_admin) }
      its(:name)   { should eq "Jane" }
      its(:gender) { should eq "Female" }
      it           { should be_admin }
    end
  end

  context "child class with scoped trait and inherited trait" do
    subject      { FactoryBot.create(:female_admin_judy) }
    its(:name)   { should eq "Judy" }
    its(:gender) { should eq "Female" }
    it           { should be_admin }
  end

  context "factory using global trait" do
    subject     { FactoryBot.create(:user_with_email) }
    its(:name)  { should eq "Bill" }
    its(:email) { should eq "Bill@example.com"}
  end

  context "factory created with alternate syntax for specifying trait" do
    subject      { FactoryBot.create(:male_user) }
    its(:gender) { should eq "Male" }
  end

  context "factory created with alternate syntax where trait name and attribute are the same" do
    subject     { FactoryBot.create(:great_user) }
    its(:great) { should eq "GREAT!!!" }
  end

  context "factory created with alternate syntax where trait name and attribute are the same and attribute is overridden" do
    subject     { FactoryBot.create(:great_user, great: "SORT OF!!!") }
    its(:great) { should eq "SORT OF!!!" }
  end

  context "child factory created where trait attributes are inherited" do
    subject             { FactoryBot.create(:child_male_user) }
    its(:gender)        { should eq "Male" }
    its(:date_of_birth) { should eq Date.parse("1/1/2000") }
  end

  context "factory outside of scope" do
    subject     { FactoryBot.create(:user_without_admin_scoping) }
    it { expect { subject }.to raise_error(ArgumentError, "Trait not registered: admin_trait") }
  end

  context "child factory using grandparents' trait" do
    subject     { FactoryBot.create(:female_great_user) }
    its(:great) { should eq "GREAT!!!" }
  end
end

describe "traits with callbacks" do
  before do
    define_model("User", name: :string)

    FactoryBot.define do
      factory :user do
        name "John"

        trait :great do
          after(:create) { |user| user.name.upcase! }
        end

        trait :awesome do
          after(:create) { |user| user.name = "awesome" }
        end

        factory :caps_user, traits: [:great]
        factory :awesome_user, traits: [:great, :awesome]

        factory :caps_user_implicit_trait do
          great
        end
      end
    end
  end

  context "when the factory has a trait passed via arguments" do
    subject    { FactoryBot.create(:caps_user) }
    its(:name) { should eq "JOHN" }
  end

  context "when the factory has an implicit trait" do
    subject    { FactoryBot.create(:caps_user_implicit_trait) }
    its(:name) { should eq "JOHN" }
  end

  it "executes callbacks in the order assigned" 

end

describe "traits added via strategy" do
  before do
    define_model("User", name: :string, admin: :boolean)

    FactoryBot.define do
      factory :user do
        name "John"

        trait :admin do
          admin true
        end

        trait :great do
          after(:create) { |user| user.name.upcase! }
        end
      end
    end
  end

  context "adding traits in create" do
    subject { FactoryBot.create(:user, :admin, :great, name: "Joe") }

    its(:admin) { should be true }
    its(:name)  { should eq "JOE" }

    it "doesn't modify the user factory" 

  end

  context "adding traits in build" do
    subject { FactoryBot.build(:user, :admin, :great, name: "Joe") }

    its(:admin) { should be true }
    its(:name)  { should eq "Joe" }
  end

  context "adding traits in attributes_for" do
    subject { FactoryBot.attributes_for(:user, :admin, :great) }

    its([:admin]) { should be true }
    its([:name])  { should eq "John" }
  end

  context "adding traits in build_stubbed" do
    subject { FactoryBot.build_stubbed(:user, :admin, :great, name: "Jack") }

    its(:admin) { should be true }
    its(:name)  { should eq "Jack" }
  end

  context "adding traits in create_list" do
    subject { FactoryBot.create_list(:user, 2, :admin, :great, name: "Joe") }

    its(:length) { should eq 2 }

    it "creates all the records" 

  end

  context "adding traits in build_list" do
    subject { FactoryBot.build_list(:user, 2, :admin, :great, name: "Joe") }

    its(:length) { should eq 2 }

    it "builds all the records" 

  end
end

describe "traits and dynamic attributes that are applied simultaneously" do
  before do
    define_model("User", name: :string, email: :string, combined: :string)

    FactoryBot.define do
      trait :email do
        email { "#{name}@example.com" }
      end

      factory :user do
        name "John"
        email
        combined { "#{name} <#{email}>" }
      end
    end
  end

  subject        { FactoryBot.build(:user) }
  its(:name)     { should eq "John" }
  its(:email)    { should eq "John@example.com" }
  its(:combined) { should eq "John <John@example.com>" }
end

describe "applying inline traits" do
  before do
    define_model("User") do
      has_many :posts
    end

    define_model("Post", user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user do
        trait :with_post do
          posts { [ Post.new ] }
        end
      end
    end
  end

  it "applies traits only to the instance generated for that call" 

end

describe "inline traits overriding existing attributes" do
  before do
    define_model("User", status: :string)

    FactoryBot.define do
      factory :user do
        status "pending"

        trait(:accepted) { status "accepted" }
        trait(:declined) { status "declined" }

        factory :declined_user, traits: [:declined]
        factory :extended_declined_user, traits: [:declined] do
          status "extended_declined"
        end
      end
    end
  end

  it "returns the default status" 


  it "prefers inline trait attributes over default attributes" 


  it "prefers traits on a factory over default attributes" 


  it "prefers inline trait attributes over traits on a factory" 


  it "prefers attributes on factories over attributes from non-inline traits" 


  it "prefers inline traits over attributes on factories" 


  it "prefers overridden attributes over attributes from traits, inline traits, or attributes on factories" 

end

describe "making sure the factory is properly compiled the first time we want to instantiate it" do
  before do
    define_model("User", role: :string, gender: :string, age: :integer)

    FactoryBot.define do
      factory :user do
        trait(:female) { gender "female" }
        trait(:admin) { role "admin" }

        factory :female_user do
          female
        end
      end
    end
  end

  it "can honor traits on the very first call" 

end

describe "traits with to_create" do
  before do
    define_model("User", name: :string)

    FactoryBot.define do
      factory :user do
        trait :with_to_create do
          to_create { |instance| instance.name = "to_create" }
        end

        factory :sub_user do
          to_create { |instance| instance.name = "sub" }

          factory :child_user
        end

        factory :sub_user_with_trait do
          with_to_create

          factory :child_user_with_trait
        end

        factory :sub_user_with_trait_and_override do
          with_to_create
          to_create { |instance| instance.name = "sub with trait and override" }

          factory :child_user_with_trait_and_override
        end
      end
    end
  end

  it "can apply to_create from traits" 


  it "can apply to_create from the definition" 


  it "gives additional traits higher priority than to_create from the definition" 


  it "gives base traits normal priority" 


  it "gives base traits lower priority than overrides" 


  it "gives additional traits higher priority than base traits and factory definition" 

end

describe "traits with initialize_with" do
  before do
    define_class("User") do
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    FactoryBot.define do
      factory :user do
        trait :with_initialize_with do
          initialize_with { new("initialize_with") }
        end

        factory :sub_user do
          initialize_with { new("sub") }

          factory :child_user
        end

        factory :sub_user_with_trait do
          with_initialize_with

          factory :child_user_with_trait
        end

        factory :sub_user_with_trait_and_override do
          with_initialize_with
          initialize_with { new("sub with trait and override") }

          factory :child_user_with_trait_and_override
        end
      end
    end
  end

  it "can apply initialize_with from traits" 


  it "can apply initialize_with from the definition" 


  it "gives additional traits higher priority than initialize_with from the definition" 


  it "gives base traits normal priority" 


  it "gives base traits lower priority than overrides" 


  it "gives additional traits higher priority than base traits and factory definition" 

end

describe "nested implicit traits" do
  before do
    define_class("User") do
      attr_accessor :gender, :role
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end

  shared_examples_for "assigning data from traits" do
    it "assigns the correct values" 

  end

  context "defined outside the factory" do
    before do
      FactoryBot.define do
        trait :female do
          gender "female"
          to_create { |instance| instance.gender = instance.gender.upcase }
        end

        trait :jane_doe do
          initialize_with { new("Jane Doe") }
        end

        trait :admin do
          role "admin"
          after(:build) { |instance| instance.role = instance.role.upcase }
        end

        trait :female_admin do
          female
          admin
          jane_doe
        end

        factory :user
      end
    end

    it_should_behave_like "assigning data from traits"
  end

  context "defined inside the factory" do
    before do
      FactoryBot.define do
        factory :user do
          trait :female do
            gender "female"
            to_create { |instance| instance.gender = instance.gender.upcase }
          end

          trait :jane_doe do
            initialize_with { new("Jane Doe") }
          end

          trait :admin do
            role "admin"
            after(:build) { |instance| instance.role = instance.role.upcase }
          end

          trait :female_admin do
            female
            admin
            jane_doe
          end
        end
      end
    end

    it_should_behave_like "assigning data from traits"
  end
end

describe "implicit traits containing callbacks" do
  before do
    define_model("User", value: :integer)

    FactoryBot.define do
      factory :user do
        value 0

        trait :trait_with_callback do
          after(:build) { |user| user.value += 1 }
        end

        factory :user_with_trait_with_callback do
          trait_with_callback
        end
      end
    end
  end

  it "only runs the callback once" 

end

describe "traits used in associations" do
  before do
    define_model("User", admin: :boolean, name: :string)

    define_model("Comment", user_id: :integer) do
      belongs_to :user
    end

    define_model("Order", creator_id: :integer) do
      belongs_to :creator, class_name: 'User'
    end

    define_model("Post", author_id: :integer) do
      belongs_to :author, class_name: 'User'
    end

    FactoryBot.define do
      factory :user do
        admin false

        trait :admin do
          admin true
        end
      end

      factory :post do
        association :author, factory: [:user, :admin], name: 'John Doe'
      end

      factory :comment do
        association :user, :admin, name: 'Joe Slick'
      end

      factory :order do
        association :creator, :admin, factory: :user, name: 'Joe Creator'
      end
    end
  end

  it "allows assigning traits for the factory of an association" 


  it "allows inline traits with the default association" 


  it "allows inline traits with a specific factory for an association" 

end

