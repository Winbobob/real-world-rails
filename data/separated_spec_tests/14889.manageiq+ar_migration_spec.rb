shared_context "without the migrations ran column" do
  before do
    column_list = %w(id region created_at updated_at description guid).map { |n| double(:name => n) }
    allow(ActiveRecord::Base.connection).to receive(:columns).with("miq_regions").and_return(column_list)
  end
end

shared_context "with a dummy version" do
  let(:version) { "1234567890" }

  # sanity check - if this is somehow a version we have, these tests will make no sense
  before { expect(my_region.migrations_ran).not_to include(version) }
end

context "with a region seeded" do
  let!(:my_region) do
    MiqRegion.seed
    MiqRegion.my_region
  end

  describe ArPglogicalMigration::PglogicalMigrationHelper do
    context "without the migrations ran column" do
      include_context "without the migrations ran column"

      describe ".migrations_column_present?" do
        it "is falsey" 

      end

      describe ".update_local_migrations_ran" do
        it "does nothing" 

      end
    end

    describe ".migrations_column_present?" do
      it "is truthy" 

    end

    describe ".update_local_migrations_ran" do
      include_context "with a dummy version"

      it "adds the given version when the direction is :up" 


      it "doesn't blow up when there is no region" 

    end
  end

  describe ArPglogicalMigration::RemoteRegionMigrationWatcher do
    include_context "with a dummy version"

    let(:subscription) { double("Subscription", :enable => nil, :disable => nil, :provider_region => my_region.region) }

    subject do
      described_class.new(subscription, version).tap do |s|
        allow(s).to receive_messages(:puts => nil, :print => nil)
      end
    end

    describe "#wait_for_remote_region_migrations" do
      context "without the migrations ran column present" do
        include_context "without the migrations ran column"

        it "does nothing" 

      end

      it "sleeps until the migration is added" 

    end
  end
end

