require 'spec_helper'
require 'rake'

describe 'crm tasks' do
  describe 'crm:resync_charges' do
    let(:crm) { build_stubbed(:crm) }
    let(:organization) { build_stubbed(:organization, slug: 'my_organization', crm: crm) }
    let(:organization_slug) { 'my_organization' }

    before :all do
      Rake.application.rake_require "tasks/crm_tasks"
      Rake::Task.define_task(:environment)
    end

    before :each do
      Rake::Task['crm:resync_charges'].reenable
      ENV.delete('ORGANIZATION_SLUG')

      allow(Organization).to receive(:find_by_slug).with(organization_slug).and_return(organization)
    end

    it "should raise error if missing ORGANIZATION_SLUG parameter" 


    it "should raise error if organisation not found" 


    context "Valid organization" do
      let(:charges_relation) { double }

      before :each do
        ENV['ORGANIZATION_SLUG'] = organization_slug

        expect(organization).to receive(:charges).and_return(charges_relation)
        expect(charges_relation).to receive(:paid).and_return(charges_relation)
      end

      context "CRM is BSD" do
        before :each do
          crm.platform = 'bluestate'

          expect(charges_relation).to receive(:where).with("(SELECT COUNT(*) FROM log_entries WHERE log_entries.charge_id = charges.id AND log_entries.message = 'Synchronized to Blue State Digital') = 0").and_return(charges_relation)
        end

        it "should enqueue jobs on CrmNotificationWorker for each charge" 


        it "should not filter by external_id" 

      end

      context "CRM is AK" do
        it "should filter by external_id" 

      end
    end
  end
end

