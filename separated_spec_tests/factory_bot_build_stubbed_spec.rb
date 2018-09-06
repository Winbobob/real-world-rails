require 'spec_helper'

describe "a generated stub instance" do
  include FactoryBot::Syntax::Methods

  before do
    define_model('User')

    define_model('Post', title:   :string,
                         body:    :string,
                         age:     :integer,
                         user_id: :integer) do
      belongs_to :user
    end

    FactoryBot.define do
      factory :user

      factory :post do
        title { "default title" }
        body { "default body" }
        user
      end
    end
  end

  subject { build_stubbed(:post, title: 'overridden title') }

  it "assigns a default attribute" 


  it "assigns an overridden attribute" 


  it "assigns associations" 


  it "has an id" 


  it "generates unique ids" 


  it "isn't a new record" 


  it "assigns associations that aren't new records" 


  it "isn't changed" 


  it "disables connection" 


  it "disables update_attribute" 


  it "disables reload" 


  it "disables destroy" 


  it "disables save" 


  it "disables increment" 


  it "disables decrement" 

end

describe "calling `build_stubbed` with a block" do
  include FactoryBot::Syntax::Methods

  before do
    define_model('Company', name: :string)

    FactoryBot.define do
      factory :company
    end
  end

  it "passes the stub instance" 


  it "returns the stub instance" 

end

describe "defaulting `created_at`" do
  include FactoryBot::Syntax::Methods

  before do
    define_model('ThingWithTimestamp', created_at: :datetime)
    define_model('ThingWithoutTimestamp')

    FactoryBot.define do
      factory :thing_with_timestamp
      factory :thing_without_timestamp
    end

    Timecop.freeze 2012, 1, 1
  end

  it "defaults created_at for objects with created_at" 


  it "defaults created_at for objects with created_at to the correct time with zone" 


  it "adds created_at to objects who don't have the method" 


  it "allows overriding created_at for objects with created_at" 


  it "doesn't allow setting created_at on an object that doesn't define it" 

end

describe "defaulting `updated_at`" do
  include FactoryBot::Syntax::Methods

  before do
    define_model("ThingWithTimestamp", updated_at: :datetime)
    define_model("ThingWithoutTimestamp")

    FactoryBot.define do
      factory :thing_with_timestamp
      factory :thing_without_timestamp
    end

    Timecop.freeze 2012, 1, 1
  end

  it "defaults updated_at for objects with updated_at" 


  it "adds updated_at to objects who don't have the method" 


  it "allows overriding updated_at for objects with updated_at" 


  it "doesn't allow setting updated_at on an object that doesn't define it" 

end

describe 'defaulting `id`' do
  before do
    define_model('Post')

    FactoryBot.define do
      factory :post
    end
  end

  it 'allows overriding id' 

end

