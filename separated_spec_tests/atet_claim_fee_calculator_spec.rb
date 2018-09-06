require 'rails_helper'

RSpec.describe ClaimFeeCalculator, type: :remissions do
  let(:claim) { Claim.new }

  def calculation
    described_class.calculate claim: claim
  end

  describe '.calculate' do
    describe 'calculating the application fee' do
      context 'when the claim pertains to discrimination or unfair dismissal or protective award' do
        before do
          allow(claim).
            to receive(:attracts_higher_fee?).
            and_return true
        end

        context 'with no claimants' do
          before { allow(claim).to receive(:claimant_count).and_return 0 }

          it 'is 0' 

        end

        context 'with a single claimant' do
          before { allow(claim).to receive(:claimant_count).and_return 1 }

          it 'is 250' 

        end

        context "with 2..10 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(2..10)) }

          it "is 500" 

        end

        context "with 11..200 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(11..200)) }

          it "is 1000" 

        end

        context 'with 201 or more claimants' do
          before { allow(claim).to receive(:claimant_count).and_return Float::INFINITY }

          it "is 1500" 

        end
      end

      context 'when the claim does not pertain to discrimination or unfair dismissal' do
        before do
          allow(claim).
            to receive(:attracts_higher_fee?).
            and_return false
        end

        context 'with no claimants' do
          before { allow(claim).to receive(:claimant_count).and_return 0 }

          it 'is 0' 

        end

        context 'with a single claimant' do
          before { allow(claim).to receive(:claimant_count).and_return 1 }

          it 'is 160' 

        end

        context "with 2..10 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(2..10)) }

          it "is 320" 

        end

        context "with 11..200 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(11..200)) }

          it "is 640" 

        end

        context 'with 201 or more claimants' do
          before { allow(claim).to receive(:claimant_count).and_return Float::INFINITY }

          it "is 960" 

        end
      end
    end

    describe 'calculating the hearing fee' do
      context 'when the claim pertains to discrimination or unfair dismissal' do
        before do
          allow(claim).
            to receive(:attracts_higher_fee?).
            and_return true
        end

        context 'with no claimants' do
          before { allow(claim).to receive(:claimant_count).and_return 0 }

          it 'is 0' 

        end

        context 'with a single claimant' do
          before { allow(claim).to receive(:claimant_count).and_return 1 }

          it 'is 950' 

        end

        context "with 2..10 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(2..10)) }

          it "is 1900" 

        end

        context "with 11..200 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(11..200)) }

          it "is 3800" 

        end

        context 'with 201 or more claimants' do
          before { allow(claim).to receive(:claimant_count).and_return Float::INFINITY }

          it "is 5700" 

        end
      end

      context 'when the claim does not pertain to discrimination or unfair dismissal' do
        before do
          allow(claim).
            to receive(:attracts_higher_fee?).
            and_return false
        end

        context 'with no claimants' do
          before { allow(claim).to receive(:claimant_count).and_return 0 }

          it 'is 0' 

        end

        context 'with a single claimant' do
          before { allow(claim).to receive(:claimant_count).and_return 1 }

          it 'is 230' 

        end

        context "with 2..10 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(2..10)) }

          it "is 460" 

        end

        context "with 11..200 claimants" do
          before { allow(claim).to receive(:claimant_count).and_return(*(11..200)) }

          it "is 920" 

        end

        context 'with 201 or more claimants' do
          before { allow(claim).to receive(:claimant_count).and_return Float::INFINITY }

          it "is 1380" 

        end
      end
    end

    describe 'calculating the application fee with remission' do
      context 'with no claimants' do
        before do
          allow(claim).to receive(:remission_claimant_count).and_return 1
          allow(claim).to receive(:claimant_count).and_return 0
        end

        it 'is 0' 

      end

      context 'for a single claimant who is claiming remission' do
        before do
          allow(claim).to receive(:claimant_count).and_return 1
          allow(claim).to receive(:remission_claimant_count).and_return 1
        end

        it 'is 0, i.e. 100% remission' 

      end

      context 'for 2..10 claimants' do
        context 'when number_of_claimants - number_of_claimants_applying_for_remission' do
          context 'is less than or equal to 2' do
            it 'is equal to regular_fee / 2 * (number_of_claimants - number_of_claimants_applying_for_remission)' 

          end

          context 'is greater than 2' do
            it 'is equal to the regular fee' 

          end
        end
      end

      context "with 11..200 claimants" do
        context 'when number of claimants - number of claimants applying for remission' do
          context 'is less than or equal to 4' do
            it 'is equal to regular_fee / 4 * (number_of_claimants - number_of_claimants_applying_for_remission)' 

          end

          context 'is greater than 4' do
            it 'is equal to the regular fee' 

          end
        end
      end

      context "with 201 or more claimants" do
        context 'when number of claimants - number of claimants applying for remission' do
          let(:claimant_count) { 201 }

          context 'is less than or equal to 6' do

            it 'is equal to regular_fee / 6 * (number_of_claimants - number_of_claimants_applying_for_remission)' 

          end

          context 'is greater than 6' do
            it 'is equal to the regular fee' 

          end
        end
      end
    end
  end
end

