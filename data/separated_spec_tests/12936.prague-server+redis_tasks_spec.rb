require 'spec_helper'
require 'rake'

describe 'redis tasks' do
  describe 'redis:set_keys_expiration' do
    let(:organizations) { build_stubbed_list(:organization, 2)}
    let(:tags) { build_stubbed_list(:tag, 2) }
    let(:tag_namespaces) { build_stubbed_list(:tag_namespace, 2) }
    let(:redis) { double }

    before :all do
      Rake.application.rake_require "tasks/redis_tasks"
      Rake::Task.define_task(:environment)
    end

    before :each do
      Rake::Task['redis:set_keys_expiration'].reenable
      ENV.delete('STRIPE_STATUS')
      allow(PragueServer::Application).to receive(:redis).and_return(redis)
      organizations.each_with_index { |o, index| allow(o).to receive(:slug).and_return("#{o.name.parameterize}-#{index}") }

      allow(Organization).to receive(:find_each).and_yield(organizations.first).and_yield(organizations.last)
      allow(Tag).to receive(:find_each).and_yield(tags.first).and_yield(tags.last)
      allow(TagNamespace).to receive(:find_each).and_yield(tag_namespaces.first).and_yield(tag_namespaces.last)
    end

    it 'should expire daily aggregations for organization, tag and tag namespace' 


    it 'should raise if invalid STRIPE_STATUS' 


    it 'should expire daily aggregations on test environment' 


    def expectations_on_keys_and_expirations(*keys)
      key_dates = [DateTime.new(2017, 1, 1), DateTime.new(2017, 1, 2)]

      keys.each do |key|
        expect(redis).to receive(:keys)
          .with("#{key}/year:*/month:*/day:*")
          .and_return(key_dates.map {|date| "#{key}/year:#{date.year}/month:#{date.month}/day:#{date.day}" })

        key_dates.each do |date|
          expect(redis).to receive(:expireat).with("#{key}/year:#{date.year}/month:#{date.month}/day:#{date.day}", date.to_i + DateAggregation::KEY_EXPIRATION_FOR_DAY_KEYS)
        end
      end
    end
  end
end

