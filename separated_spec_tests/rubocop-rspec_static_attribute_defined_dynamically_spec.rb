# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
RSpec.describe RuboCop::Cop::RSpec::FactoryBot::StaticAttributeDefinedDynamically do
  # rubocop:enable Metrics/LineLength

  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  %w[FactoryBot FactoryGirl].each do |factory_bot|
    context "when using #{factory_bot}" do
      it 'registers an offense for offending code' 


      it 'registers an offense in a trait' 


      it 'accepts valid factory definitions' 


      it 'does not add offense if out of factory girl block' 


      bad = <<-RUBY
        #{factory_bot}.define do
          factory :post do
            comments_count { 0 }
            type { User::MAGIC }
            description { nil }
            title {}
            recent_statuses { [:published, :draft] }
            meta_tags { { foo: 1 } }
          end
        end
      RUBY

      corrected = <<-RUBY
        #{factory_bot}.define do
          factory :post do
            comments_count 0
            type User::MAGIC
            description nil
            title nil
            recent_statuses [:published, :draft]
            meta_tags({ foo: 1 })
          end
        end
      RUBY

      include_examples 'autocorrect', bad, corrected
    end
  end
end

