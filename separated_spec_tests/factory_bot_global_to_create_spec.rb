require 'spec_helper'

describe 'global to_create' do
  before do
    define_model('User', name: :string)
    define_model('Post', name: :string)

    FactoryBot.define do
      to_create { |instance| instance.name = 'persisted!' }

      trait :override_to_create do
        to_create { |instance| instance.name = 'override' }
      end

      factory :user do
        name 'John Doe'

        factory :child_user

        factory :child_user_with_trait do
          override_to_create
        end
      end

      factory :post do
        name 'Great title'

        factory :child_post

        factory :child_post_with_trait do
          override_to_create
        end
      end
    end
  end

  it 'handles base to_create' 


  it 'handles child to_create' 


  it 'handles child to_create with trait' 


  it 'handles inline trait override' 


  it 'uses to_create globally across FactoryBot.define' 

end

describe 'global skip_create' do
  before do
    define_model('User', name: :string)
    define_model('Post', name: :string)

    FactoryBot.define do
      skip_create

      trait :override_to_create do
        to_create { |instance| instance.name = 'override' }
      end

      factory :user do
        name 'John Doe'

        factory :child_user

        factory :child_user_with_trait do
          override_to_create
        end
      end

      factory :post do
        name 'Great title'

        factory :child_post

        factory :child_post_with_trait do
          override_to_create
        end
      end
    end
  end

  it 'does not persist any record' 


  it 'does not persist child records' 


  it 'honors overridden to_create' 


  it 'honors inline trait to_create' 

end

