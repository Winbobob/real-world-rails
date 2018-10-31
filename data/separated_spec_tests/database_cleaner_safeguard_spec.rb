require 'active_record'
require 'database_cleaner/active_record/transaction'

module DatabaseCleaner
  RSpec.describe Safeguard do
    let(:strategy) { DatabaseCleaner::ActiveRecord::Transaction }
    let(:cleaner)  { Base.new(:autodetect) }

    before { allow_any_instance_of(strategy).to receive(:start) }

    describe 'DATABASE_URL is set' do
      before { stub_const('ENV', 'DATABASE_URL' => database_url) }

      describe 'to any value' do
        let(:database_url) { 'postgres://remote.host' }

        it 'raises' 

      end

      describe 'to a localhost url' do
        let(:database_url) { 'postgres://localhost' }

        it 'does not raise' 

      end

      describe 'to a local tld url' do
        let(:database_url) { 'postgres://postgres.local' }

        it 'does not raise' 

      end

      describe 'to a 127.0.0.1 url' do
        let(:database_url) { 'postgres://127.0.0.1' }

        it 'does not raise' 

      end

      describe 'to a sqlite db' do
        let(:database_url) { 'sqlite3:tmp/db.sqlite3' }

        it 'does not raise' 

      end

      describe 'DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL is set' do
        let(:database_url) { 'postgres://remote.host' }
        before { stub_const('ENV', 'DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL' => true) }

        it 'does not raise' 

      end

      describe 'DatabaseCleaner.allow_remote_database_url is true' do
        let(:database_url) { 'postgres://remote.host' }
        before { DatabaseCleaner.allow_remote_database_url = true }
        after  { DatabaseCleaner.allow_remote_database_url = nil }

        it 'does not raise' 

      end
    end

    describe 'ENV is set to production' do
      %w(ENV RACK_ENV RAILS_ENV).each do |key|
        describe "on #{key}" do
          before { stub_const('ENV', key => "production") }

          it 'raises' 

        end

        describe 'DATABASE_CLEANER_ALLOW_PRODUCTION is set' do
          before { stub_const('ENV', 'DATABASE_CLEANER_ALLOW_PRODUCTION' => true) }

          it 'does not raise' 

        end

        describe 'DatabaseCleaner.allow_production is true' do
          before { DatabaseCleaner.allow_production = true }
          after  { DatabaseCleaner.allow_production = nil }

          it 'does not raise' 

        end
      end
    end
  end
end

