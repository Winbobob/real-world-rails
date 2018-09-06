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
    subject { FactoryBot.create_pair(:post) }

    its(:length) { should eq 2 }

    it "creates all the posts" 


    it "uses the default factory values" 

  end
end

