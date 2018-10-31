# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
RSpec.describe RuboCop::Cop::RSpec::FactoryBot::DynamicAttributeDefinedStatically do
  # rubocop:enable Metrics/LineLength

  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  %w[FactoryBot FactoryGirl].each do |factory_bot|
    context "when using #{factory_bot}" do
      it 'registers an offense for offending code' 


      it 'registers an offense in a trait' 


      it 'accepts valid factory definitions' 


      it 'accepts const as a static value' 


      it 'does not add offense if out of factory girl block' 


      it 'accepts valid sequence definition' 


      bad = <<-RUBY
        #{factory_bot}.define do
          factory :post do
            status([:draft, :published].sample)
            published_at 1.day.from_now
            created_at(1.day.ago)
            updated_at Time.current
            update_times [Time.current]
            meta_tags(foo: Time.current)
            other_tags({ foo: Time.current })

            trait :old do
              published_at 1.week.ago
            end
          end
        end
      RUBY

      corrected = <<-RUBY
        #{factory_bot}.define do
          factory :post do
            status { [:draft, :published].sample }
            published_at { 1.day.from_now }
            created_at { 1.day.ago }
            updated_at { Time.current }
            update_times { [Time.current] }
            meta_tags { { foo: Time.current } }
            other_tags { { foo: Time.current } }

            trait :old do
              published_at { 1.week.ago }
            end
          end
        end
      RUBY

      include_examples 'autocorrect', bad, corrected
    end
  end
end

