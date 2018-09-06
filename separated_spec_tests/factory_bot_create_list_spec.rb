require 'spec_helper'

describe "create multiple instances" do
  before do
    define_model('Post', title: :string, position: :integer)

    FactoryBot.define do
      factory(:post) do |post|
        post.title "Through the Looking Glass"
        post.position { rand(10**4) }
      end
    end
  end

  context "without default attributes" do
    subject { FactoryBot.create_list(:post, 20) }

    its(:length) { should eq 20 }

    it "creates all the posts" 


    it "uses the default factory values" 

  end

  context "with default attributes" do
    subject { FactoryBot.create_list(:post, 20, title: "The Hunting of the Snark") }

    it "overrides the default values" 

  end

  context "with a block" do
    subject do
      FactoryBot.create_list(:post, 20, title: "The Listing of the Block") do |post|
        post.position = post.id
      end
    end

    it "uses the new values" 

  end

  context "without the count" do
    subject { FactoryBot.create_list(:post, title: "The Hunting of the Bear") }

    it "raise ArgumentError with the proper error message" 

  end
end

describe "multiple creates and transient attributes to dynamically build attribute lists" do
  before do
    define_model('User', name: :string) do
      has_many :posts
    end

    define_model('Post', title: :string, user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :post do
        title "Through the Looking Glass"
        user
      end

      factory :user do
        name "John Doe"

        factory :user_with_posts do
          transient do
            posts_count 5
          end

          after(:create) do |user, evaluator|
            FactoryBot.create_list(:post, evaluator.posts_count, user: user)
          end
        end
      end
    end
  end

  it "generates the correct number of posts" 


  it "allows the number of posts to be modified" 

end

