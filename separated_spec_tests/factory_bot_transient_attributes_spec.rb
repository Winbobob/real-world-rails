require "spec_helper"

describe "transient attributes" do
  before do
    define_model("User", name: :string, email: :string)

    FactoryBot.define do
      sequence(:name) { |n| "John #{n}" }

      factory :user do
        transient do
          four     { 2 + 2 }
          rockstar true
          upcased  false
        end

        name  { "#{FactoryBot.generate(:name)}#{" - Rockstar" if rockstar}" }
        email { "#{name.downcase}#{four}@example.com" }

        after(:create) do |user, evaluator|
          user.name.upcase! if evaluator.upcased
        end
      end
    end
  end

  context "returning attributes for a factory" do
    subject { FactoryBot.attributes_for(:user, rockstar: true) }
    it { should_not have_key(:four) }
    it { should_not have_key(:rockstar) }
    it { should_not have_key(:upcased) }
    it { should     have_key(:name) }
    it { should     have_key(:email) }
  end

  context "with a transient variable assigned" do
    let(:rockstar)           { FactoryBot.create(:user, rockstar: true, four: "1234") }
    let(:rockstar_with_name) { FactoryBot.create(:user, name: "Jane Doe", rockstar: true) }
    let(:upcased_rockstar)   { FactoryBot.create(:user, rockstar: true, upcased: true) }
    let(:groupie)            { FactoryBot.create(:user, rockstar: false) }

    it "generates the correct attributes on a rockstar" 


    it "generates the correct attributes on an upcased rockstar" 


    it "generates the correct attributes on a groupie" 


    it "generates the correct attributes on a rockstar with a name" 

  end

  context "without transient variables assigned" do
    let(:rockstar) { FactoryBot.create(:user) }

    it "uses the default value of the attribute" 

  end

  context "using aliased 'ignore' method name", :silence_deprecation do
    before do
      FactoryBot.define do
        factory :user_using_ignore, class: User do
          ignore do
            honorific "Esteemed"
          end

          name { "#{honorific} Jane Doe" }
        end
      end
    end

    let(:esteemed) { FactoryBot.create(:user_using_ignore) }

    it "uses the default value of the attribute" 

  end
end

describe "transient sequences" do
  before do
    define_model("User", name: :string)

    FactoryBot.define do
      factory :user do
        transient do
          sequence(:counter)
        end

        name { "John Doe #{counter}" }
      end
    end
  end

  it "increments sequences correctly" 

end

describe "assigning values from a transient attribute" do
  before do
    define_class("User") do
      attr_accessor :foo_id, :foo_name
    end

    define_class("Foo") do
      attr_accessor :id, :name
      def initialize(id, name)
        @id = id
        @name = name
      end
    end

    FactoryBot.define do
      factory :user do
        transient do
          foo { Foo.new('id-of-foo', 'name-of-foo')}
        end

        foo_id   { foo.id }
        foo_name { foo.name }
      end
    end
  end

  it "does not ignore an _id attribute that is an alias for a transient attribute" 

end

