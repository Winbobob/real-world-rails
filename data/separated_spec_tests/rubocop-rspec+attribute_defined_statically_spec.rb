# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::FactoryBot::AttributeDefinedStatically do # rubocop:disable Metrics/LineLength
  subject(:cop) { described_class.new }

  it 'registers an offense for offending code' 


  it 'registers an offense in a trait' 


  it 'registers an offense in a transient block' 


  it 'registers an offense for an attribute defined on `self`' 


  it 'accepts valid factory definitions' 


  it 'does not add offense if out of factory bot block' 


  it 'accepts valid association definitions' 


  it 'accepts valid sequence definition' 


  bad = <<-RUBY
    FactoryBot.define do
      factory :post do
        title "Something"
        comments_count 0
        tag Tag::MAGIC
        recent_statuses []
        status([:draft, :published].sample)
        published_at 1.day.from_now
        created_at(1.day.ago)
        updated_at Time.current
        update_times [Time.current]
        meta_tags(foo: Time.current)
        other_tags({ foo: Time.current })
        options color: :blue
        other_options Tag::MAGIC => :magic
        self.end Date.tomorrow

        trait :old do
          published_at 1.week.ago
        end
      end
    end
  RUBY

  corrected = <<-RUBY
    FactoryBot.define do
      factory :post do
        title { "Something" }
        comments_count { 0 }
        tag { Tag::MAGIC }
        recent_statuses { [] }
        status { [:draft, :published].sample }
        published_at { 1.day.from_now }
        created_at { 1.day.ago }
        updated_at { Time.current }
        update_times { [Time.current] }
        meta_tags { { foo: Time.current } }
        other_tags { { foo: Time.current } }
        options { { color: :blue } }
        other_options { { Tag::MAGIC => :magic } }
        self.end { Date.tomorrow }

        trait :old do
          published_at { 1.week.ago }
        end
      end
    end
  RUBY

  include_examples 'autocorrect', bad, corrected
end

