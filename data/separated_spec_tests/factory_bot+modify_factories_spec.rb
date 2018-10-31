describe "modifying factories" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("User", name: :string, admin: :boolean, email: :string, login: :string)

    FactoryBot.define do
      sequence(:email) { |n| "user#{n}@example.com" }

      factory :user do
        email

        after(:create) do |user|
          user.login = user.name.upcase if user.name
        end

        factory :admin do
          admin { true }
        end
      end
    end
  end

  context "simple modification" do
    before do
      FactoryBot.modify do
        factory :user do
          name { "Great User" }
        end
      end
    end

    subject     { create(:user) }
    its(:name)  { should eq "Great User" }
    its(:login) { should eq "GREAT USER" }

    it "doesn't allow the factory to be subsequently defined" 


    it "does allow the factory to be subsequently modified" 

  end

  context "adding callbacks" do
    before do
      FactoryBot.modify do
        factory :user do
          name { "Great User" }
          after(:create) do |user|
            user.name = user.name.downcase
            user.login = nil
          end
        end
      end
    end

    subject { create(:user) }

    its(:name)  { should eq "great user" }
    its(:login) { should be_nil }
  end

  context "reusing traits" do
    before do
      FactoryBot.define do
        trait :rockstar do
          name { "Johnny Rockstar!!!" }
        end
      end

      FactoryBot.modify do
        factory :user do
          rockstar
          email { "#{name}@example.com" }
        end
      end
    end

    subject     { create(:user) }

    its(:name)  { should eq "Johnny Rockstar!!!" }
    its(:email) { should eq "Johnny Rockstar!!!@example.com" }
    its(:login) { should eq "JOHNNY ROCKSTAR!!!" }
  end

  context "redefining attributes" do
    before do
      FactoryBot.modify do
        factory :user do
          email { "#{name}-modified@example.com" }
          name { "Great User" }
        end
      end
    end

    context "creating user" do
      context "without overrides" do
        subject     { create(:user) }

        its(:name)  { should eq "Great User" }
        its(:email) { should eq "Great User-modified@example.com" }
      end

      context "overriding the email" do
        subject     { create(:user, email: "perfect@example.com") }

        its(:name)  { should eq "Great User" }
        its(:email) { should eq "perfect@example.com" }
      end

      context "overriding the name" do
        subject     { create(:user, name: "wonderful") }

        its(:name)  { should eq "wonderful" }
        its(:email) { should eq "wonderful-modified@example.com" }
      end
    end

    context "creating admin" do
      context "without overrides" do
        subject     { create(:admin) }

        its(:name)  { should eq "Great User" }
        its(:email) { should eq "Great User-modified@example.com" }
        its(:admin) { should be true }
      end

      context "overriding the email" do
        subject     { create(:admin, email: "perfect@example.com") }

        its(:name)  { should eq "Great User" }
        its(:email) { should eq "perfect@example.com" }
        its(:admin) { should be true }
      end

      context "overriding the name" do
        subject     { create(:admin, name: "wonderful") }

        its(:name)  { should eq "wonderful" }
        its(:email) { should eq "wonderful-modified@example.com" }
        its(:admin) { should be true }
      end
    end
  end

  it "doesn't overwrite already defined child's attributes" 


  it "allows for overriding child classes" 


  it "raises an exception if the factory was not defined before" 

end

