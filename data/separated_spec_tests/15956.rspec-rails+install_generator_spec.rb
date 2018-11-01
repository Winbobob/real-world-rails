# Generators are not automatically loaded by Rails
require 'generators/rspec/install/install_generator'
require 'support/generators'

RSpec.describe Rspec::Generators::InstallGenerator, :type => :generator do
  def use_active_record_migration
    match(/ActiveRecord::Migration\./m)
  end

  def check_pending_migrations
    match(/ActiveRecord::Migration\.check_pending!/m)
  end

  def content_for(file_name)
    File.read(file(file_name))
  end

  def have_a_fixture_path
    match(/config\.fixture_path/m)
  end

  def maintain_test_schema
    match(/ActiveRecord::Migration\.maintain_test_schema!/m)
  end

  def require_rspec_rails
    match(/^require 'rspec\/rails'$/m)
  end

  def have_transactional_fixtures_enabled?
    match(/config\.use_transactional_fixtures/m)
  end

  def filter_rails_from_backtrace
    match(/config\.filter_rails_from_backtrace!/m)
  end

  setup_default_destination

  let(:rails_helper) { content_for('spec/rails_helper.rb') }
  let(:spec_helper) { content_for('spec/spec_helper.rb') }
  let(:developmentrb) { content_for('config/environments/development.rb')  }

  it "generates .rspec" 


  it "generates spec/spec_helper.rb" 


  it "does not configure warnings in the spec/spec_helper.rb" 


  context "generates spec/rails_helper.rb" do
    specify "requiring rspec/rails" do
      run_generator
      expect(rails_helper).to require_rspec_rails
    end

    specify "with transactional fixtures" do
      run_generator
      expect(rails_helper).to have_a_fixture_path
    end

    specify "with default fixture path" do
      run_generator
      expect(rails_helper).to have_transactional_fixtures_enabled?
    end

    specify "excluding rails gems from the backtrace" do
      run_generator

      expect(rails_helper).to filter_rails_from_backtrace
    end

    if RSpec::Rails::FeatureCheck.can_maintain_test_schema?
      specify "checking for maintaining the schema" do
        run_generator
        expect(rails_helper).to maintain_test_schema
      end
    elsif RSpec::Rails::FeatureCheck.can_check_pending_migrations?
      specify "checking for pending migrations" do
        run_generator
        expect(rails_helper).to check_pending_migrations
      end
    else
      specify "without a check for pending migrations" do
        run_generator
        expect(rails_helper).not_to use_active_record_migration
      end
    end
  end

  context "generates spec/rails_helper.rb", "without ActiveRecord available" do
    before do
      hide_const("ActiveRecord")
    end

    it "requires rspec/rails" 


    it "does not include config.fixture_path" 


    it "does not include config.use_transactional_fixtures" 


    it "does not check use active record migration options" 

  end

end
