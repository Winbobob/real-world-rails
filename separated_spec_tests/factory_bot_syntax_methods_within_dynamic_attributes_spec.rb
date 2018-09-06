require "spec_helper"

describe "syntax methods within dynamic attributes" do
  before do
    define_model("Post", title: :string, user_id: :integer) do
      belongs_to :user

      def generate
        "generate result"
      end
    end
    define_model("User", email: :string)

    FactoryBot.define do
      sequence(:email_address) { |n| "person-#{n}@example.com" }

      factory :user do
        email { generate(:email_address) }
      end

      factory :post do
        title { generate }
        user { build(:user) }
      end
    end
  end

  it "can access syntax methods from dynamic attributes" 


  it "can access syntax methods from dynamic attributes" 


  it "can access methods already existing on the class" 


  it 'allows syntax methods to be used when the block has an arity of 1' 

end

