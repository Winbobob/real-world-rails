require 'spec_helper'

def travel_to(time)
  around { |example| Timecop.travel(start_of_july + time) { example.run } }
end

describe UpdateBillablePeriods do
  let!(:year) { Time.zone.now.year }

  describe "unit specs" do
    let!(:start_of_july) { Time.zone.local(year, 7) }

    let!(:updater) { UpdateBillablePeriods.new }

    describe "perform", versioning: true do
      let!(:enterprise) { create(:supplier_enterprise, created_at: start_of_july - 1.month, sells: 'any') }

      context "when no date arguments are passed to the job" do
        before do
          expect(updater).to receive(:clean_up_untouched_billable_periods_for).once
        end

        context "on the first of the month" do
          travel_to(3.hours)

          it "processes the previous month" 

        end

        context "on all other days" do
          travel_to(1.day + 3.hours)

          it "processes the current month up until previous midnight" 

        end
      end

      context "when a specfic year and month are passed as arguments" do
        let!(:updater) { UpdateBillablePeriods.new(year, 6) }

        before do
          allow(updater).to receive(:split_for_trial)
        end

        context "that ends in the past" do
          travel_to(3.hours)

          it "processes the month" 

        end

        context "that starts in the past and ends in the future (ie. current month)" do
          travel_to(-3.days)

          it "processes the current month up to the previous midnight" 

        end

        context "that starts in the future" do
          travel_to(-31.days)

          it "does not run" 

        end
      end

      context "when an enterprise is created before the beginning of the current month" do
        before do
          expect(updater).to receive(:clean_up_untouched_billable_periods_for).once
        end

        travel_to(28.days)

        context "when no alterations to sells or owner have been made during the current month" do

          it "begins at the start of the month" 

        end

        context "when sells has been changed within the current month" do
          before do
            Timecop.freeze(start_of_july + 10.days) do
              # NOTE: Sells is changed between when order1 and order2 are placed
              enterprise.update_attribute(:sells, 'own')
            end
          end

          travel_to(28.days)

          it "processes each sells period separately" 

        end

        context "when owner has been changed within the current month" do
          let!(:new_owner) { create(:user) }

          before do
            Timecop.freeze(start_of_july + 10.days) do
              # NOTE: Sells is changed between when order1 and order2 are placed
              enterprise.update_attribute(:owner, new_owner)
            end
          end

          travel_to(28.days)

          it "processes each ownership period separately" 

        end

        context "when some other attribute has been changed within the current month" do
          before do
            Timecop.freeze(start_of_july + 10.days) do
              # NOTE: Sells is changed between when order1 and order2 are placed
              enterprise.update_attribute(:name, 'Some New Name')
            end
          end

          travel_to(28.days)

          it "does not create a version, and so does not split the period" 

        end

        context "where sells or owner_id were altered during the previous month (ie. June)" do
          let!(:new_owner) { create(:user) }

          before do
            Timecop.freeze(start_of_july - 20.days) do
              # NOTE: Sells is changed between when order1 and order2 are placed
              enterprise.update_attribute(:sells, 'own')
            end
            Timecop.freeze(start_of_july - 10.days) do
              # NOTE: Sells is changed between when order1 and order2 are placed
              enterprise.update_attribute(:owner, new_owner)
            end
          end

          travel_to(28.days)

          it "ignores those verions" 

        end

        context "where sells or owner_id were altered in the future" do
          let!(:new_owner) { create(:user) }

          before do
            Timecop.freeze(start_of_july + 17.days) do
              enterprise.update_attribute(:sells, 'own')
            end
            Timecop.freeze(start_of_july + 35.days) do
              enterprise.update_attribute(:owner, new_owner)
            end
          end

          travel_to(15.days)

          it "ignores those verions" 

        end
      end

      context "when an enterprise is created during the current month" do
        before do
          expect(updater).to receive(:clean_up_untouched_billable_periods_for).once
          enterprise.update_attribute(:created_at, start_of_july + 10.days)
        end

        travel_to(28.days)

        it "begins at the date the enterprise was created" 

      end

      context "when an enterprise is created after the previous midnight" do
        before do
          expect(updater).to_not receive(:clean_up_untouched_billable_periods_for)
          enterprise.update_attribute(:created_at, start_of_july + 29.days)
        end

        travel_to(28.days)

        it "ignores the enterprise" 

      end

      pending "when an enterprise is deleted during the current month" do
        before do
          expect(updater).to receive(:clean_up_untouched_billable_periods_for).once
          enterprise.update_attribute(:deleted_at, start_of_july + 20.days)
        end

        travel_to(28.days)

        it "ends at the date the enterprise was deleted" 

      end
    end

    describe "split_for_trial" do
      let!(:enterprise) { double(:enterprise) }
      let(:begins_at) { start_of_july }
      let(:ends_at) { begins_at + 30.days }

      context "when trial_start is nil" do
        let(:trial_start) { nil }
        let(:trial_expiry) { begins_at + 3.days }

        before do
          allow(updater).to receive(:update_billable_period).once
          updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
        end

        it "calls update_billable_period once for the entire period" 

      end

      context "when trial_expiry is nil" do
        let(:trial_start) { begins_at + 3.days }
        let(:trial_expiry) { nil }

        before do
          allow(updater).to receive(:update_billable_period).once
          updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
        end

        it "calls update_billable_period once for the entire period" 

      end

      context "when the trial begins before begins_at" do
        let(:trial_start) { begins_at - 10.days }

        context "and the trial ends before begins_at" do
          let(:trial_expiry) { begins_at - 5.days }

          before do
            allow(updater).to receive(:update_billable_period).once
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the entire period" 

        end

        context "and the trial ends after begins_at" do
          let(:trial_expiry) { begins_at + 5.days }

          before do
            allow(updater).to receive(:update_billable_period).twice
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the trial period" 


          it "calls update_billable_period once for the non-trial period" 

        end

        context "and the trial ends after ends_at" do
          let(:trial_expiry) { ends_at + 5.days }

          before do
            allow(updater).to receive(:update_billable_period).once
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the entire (trial) period" 

        end
      end

      context "when the trial begins after begins_at" do
        let(:trial_start) { begins_at + 5.days }

        context "and the trial begins after ends_at" do
          let(:trial_start) { ends_at + 5.days }
          let(:trial_expiry) { ends_at + 10.days }

          before do
            allow(updater).to receive(:update_billable_period).once
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the entire period" 

        end

        context "and the trial ends before ends_at" do
          let(:trial_expiry) { ends_at - 2.days }

          before do
            allow(updater).to receive(:update_billable_period).exactly(3).times
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the non-trial period before the trial" 


          it "calls update_billable_period once for the trial period" 


          it "calls update_billable_period once for the non-trial period after the trial" 

        end

        context "and the trial ends after ends_at" do
          let(:trial_expiry) { ends_at + 5.days }

          before do
            allow(updater).to receive(:update_billable_period).twice
            updater.split_for_trial(enterprise, begins_at, ends_at, trial_start, trial_expiry)
          end

          it "calls update_billable_period once for the non-trial period" 


          it "calls update_billable_period once for the trial period" 

        end
      end
    end

    describe "update_billable_period" do
      let!(:enterprise) { create(:enterprise, sells: 'any') }

      let!(:existing) { create(:billable_period, enterprise: enterprise, begins_at: start_of_july) }

      before do
        allow(Spree::Order).to receive(:where) { [
          double(:order, total: 10),
          double(:order, total: 20),
          double(:order, total: 30)
        ]
        }
      end

      context "when the account invoice is already_complete" do
        before do
          allow(BillablePeriod).to receive(:where) { [existing] }
          allow(existing.account_invoice).to receive(:order) { double(:order, complete?: true ) }
          allow(AccountInvoice).to receive(:find_or_create_by_user_id_and_year_and_month) { existing.account_invoice }
        end

        it "does not update the billing period, but changes updated_at by touching the billable period " 

      end

      context "when arguments match both 'begins_at' and 'enterprise_id' of an existing billable period" do
        it "updates the existing billable period" 


        context "when there is nothing to update" do
          before do
            Timecop.freeze(start_of_july + 3.days) {
              existing.update_attributes(
                begins_at: start_of_july,
                ends_at: start_of_july + 20.days,
                trial: false,
                sells: enterprise.sells,
                turnover: 60
              )
            }
          end

          it "changes updated_at anyway by touching the billable period" 

        end
      end

      context "when 'begins_at' does not match an existing billable period" do
        before do
          expect{
            updater.update_billable_period(enterprise, start_of_july + 20.days, start_of_july + 30.days, false)
          }.to change{ BillablePeriod.count }.from(1).to(2)
        end

        it "creates a new existing billable period" 

      end

      context "when 'enterprise_id' does not match an existing billable period" do
        let!(:new_enterprise) { create(:enterprise, sells: 'own') }

        before do
          expect{
            updater.update_billable_period(new_enterprise, start_of_july, start_of_july + 20.days, false)
          }.to change{ BillablePeriod.count }.from(1).to(2)
        end

        it "creates a new existing billable period" 

      end
    end

    context "cleaning up untouched billable periods" do
      let(:job_start_time) { Time.zone.now }
      let(:enterprise) { create(:enterprise) }
      # Updated after start
      let!(:bp1) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time + 2.seconds, begins_at: start_of_july, ends_at: start_of_july + 5.days ) }
      let!(:bp2) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time + 2.seconds, begins_at: start_of_july + 5.days, ends_at: start_of_july + 10.days ) }
      # Updated before start
      let!(:bp3) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july, ends_at: start_of_july + 10.days ) }
      # Updated before start but begins after end_date
      let!(:bp4) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july + 10.days, ends_at: start_of_july + 15.days ) }
      # Updated before start but begins at end_date (ie. not before end_date, so should be ignored) EDGE CASE
      let!(:bp5) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july + 8.days, ends_at: start_of_july + 10.days ) }
      # Updated before start but ends before start_date
      let!(:bp6) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july - 10.days, ends_at: start_of_july - 5.days ) }
      # Updated before start but ends at start_date (ie. not after start_date, so should be ignored) EDGE CASE
      let!(:bp7) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july - 5.days, ends_at: start_of_july ) }
      # Updated before start, but order is already complete, so should not be deleted
      let!(:bp8) { create(:billable_period, enterprise: enterprise, updated_at: job_start_time - 5.seconds, begins_at: start_of_july, ends_at: start_of_july + 10.days, account_invoice: create(:account_invoice, order: create(:order, state: 'complete', completed_at: 5.minutes.ago))) }

      before do
        allow(Bugsnag).to receive(:notify)
        allow(updater).to receive(:start_date) { start_of_july }
        allow(updater).to receive(:end_date) { start_of_july + 8.days }
        updater.clean_up_untouched_billable_periods_for(enterprise, job_start_time)
      end

      it "soft deletes untouched billable_periods" 


      it "notifies bugsnag" 

    end
  end

  describe "validation spec" do
    # Chose july to test with because June has 30 days and so is easy to calculate end date for shop trial
    let!(:year) { Time.zone.now.year }
    let!(:start_of_july) { Time.zone.local(year, 7) }

    let!(:enterprise) { create(:supplier_enterprise, sells: 'any') }

    let!(:original_owner) { enterprise.owner }

    let!(:new_owner) { create(:user) }

    let!(:account_invoice1) { create(:account_invoice, user: original_owner, year: year, month: 7)}
    let!(:account_invoice2) { create(:account_invoice, user: new_owner, year: year, month: 7)}

    # This BP was updated before the current run and so should be marked for deletion at the end of the run
    let!(:obsolete_bp) { create(:billable_period, enterprise: enterprise, updated_at: start_of_july + 10.days, begins_at: start_of_july + 6.5.days, ends_at: start_of_july + 10.days ) }

    # This one has an updated_at in the future (so that it doesn't get deleted)
    # It also has a begins_at date which matches a period that would otherwise be created,
    # and so it should be picked up and overwritten
    let!(:bp_to_overwrite) { create(:billable_period, enterprise: enterprise, updated_at: start_of_july + 21.days, begins_at: start_of_july + 10.days, ends_at: start_of_july + 15.days ) }

    let!(:order1) { create(:order, completed_at: start_of_july + 1.days, distributor: enterprise) }
    let!(:order2) { create(:order, completed_at: start_of_july + 3.days, distributor: enterprise) }
    let!(:order3) { create(:order, completed_at: start_of_july + 5.days, distributor: enterprise) }
    let!(:order4) { create(:order, completed_at: start_of_july + 7.days, distributor: enterprise) }
    let!(:order5) { create(:order, completed_at: start_of_july + 9.days, distributor: enterprise) }
    let!(:order6) { create(:order, completed_at: start_of_july + 11.days, distributor: enterprise) }
    let!(:order7) { create(:order, completed_at: start_of_july + 13.days, distributor: enterprise) }
    let!(:order8) { create(:order, completed_at: start_of_july + 15.days, distributor: enterprise) }
    let!(:order9) { create(:order, completed_at: start_of_july + 17.days, distributor: enterprise) }
    let!(:order10) { create(:order, completed_at: start_of_july + 19.days, distributor: enterprise) }

    before do
      order1.line_items = [ create(:line_item, price: 12.56, order: order1) ]
      order2.line_items = [ create(:line_item, price: 87.44, order: order2) ]
      order3.line_items = [ create(:line_item, price: 50.00, order: order3) ]
      order4.line_items = [ create(:line_item, price: 73.37, order: order4) ]
      order5.line_items = [ create(:line_item, price: 22.46, order: order5) ]
      order6.line_items = [ create(:line_item, price: 44.85, order: order6) ]
      order7.line_items = [ create(:line_item, price: 93.45, order: order7) ]
      order8.line_items = [ create(:line_item, price: 59.38, order: order8) ]
      order9.line_items = [ create(:line_item, price: 47.23, order: order9) ]
      order10.line_items = [ create(:line_item, price: 2.35, order: order10) ]
      [order1, order2, order3, order4, order5, order6, order7, order8, order9, order10].each(&:update!)

      allow(Enterprise).to receive(:where) { double(:enterprises, select: [enterprise]) }
    end

    context "super complex example", versioning: true do
      before do
        enterprise.update_attribute(:created_at, start_of_july + 2.days)

        Timecop.freeze(start_of_july + 4.days) { enterprise.update_attribute(:sells, 'own') }

        Timecop.freeze(start_of_july + 6.days) { enterprise.update_attribute(:owner, new_owner) }

        enterprise.update_attribute(:shop_trial_start_date, start_of_july + 8.days)

        Timecop.freeze(start_of_july + 10.days) { enterprise.update_attribute(:owner, original_owner) }

        Timecop.freeze(start_of_july + 12.days) { enterprise.update_attribute(:sells, 'any') }

        allow(enterprise).to receive(:shop_trial_expiry) { start_of_july + 14.days }

        Timecop.freeze(start_of_july + 16.days) { enterprise.update_attribute(:sells, 'own') }

        Timecop.freeze(start_of_july + 18.days) { enterprise.update_attribute(:owner, new_owner) }
      end

      travel_to(20.days)

      before do
        UpdateBillablePeriods.new.perform
      end

      let(:billable_periods) { BillablePeriod.order(:updated_at) }

      it "creates the correct billable periods and deleted obsolete ones" 

    end
  end
end

