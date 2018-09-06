require 'spec_helper'

describe "a stubbed instance" do
  include FactoryBot::Syntax::Methods

  before do
    define_model('User')

    define_model('Post', user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user

      factory :post do
        user
      end
    end
  end

  subject { build_stubbed(:post) }

  it "acts as if it came from the database" 


  it "assigns associations and acts as if it is saved" 

end

describe "a stubbed instance overriding strategy" do
  include FactoryBot::Syntax::Methods

  before do
    define_model('User')
    define_model('Post', user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user

      factory :post do
        association(:user, strategy: :build)
      end
    end
  end

  subject { build_stubbed(:post) }

  it "acts as if it is saved in the database" 


  it "assigns associations and acts as if it is saved" 

end

