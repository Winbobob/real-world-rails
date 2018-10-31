require "rails_helper"
require "timecop"
require_relative "../../lib/rota_generation"

RSpec.describe RotaGenerationLogEntry do
  describe "#run" do
    let(:procurement_area) {
      create(:procurement_area)
    }

    let(:rota_slot) {
      build(:rota_slot)
    }

    let(:allocator) {
      double("slot allocator", allocate: [rota_slot])
    }

    let(:date_range) {
      double("date_range", build: "date_range")
    }

    let(:generator) {
      double("generator", generate_rota: [rota_slot])
    }

    let(:user) {
      create(:admin_user)
    }

    before :each do
      expect(DateRange).to receive(:new).and_return(date_range)
      expect(RotaSlotAllocator).to receive(:new).and_return(allocator)
      expect(RotaGeneration::Generator).to receive(:new).and_return(generator)
    end

    context "when the rota slots save successfully" do
      before :each do
        Timecop.freeze(2015, 1, 1, 1, 1, 1) do
          GenerateNewRota.perform_later("date_params", procurement_area.id, user.id)
        end
      end

      it "creates a successful journal entry" 


      it "puts the rota slots into the database" 

    end

    context "when the rota slots fail to save" do
      before :each do
        expect(rota_slot).to receive(:save).and_return(false)

        Timecop.freeze(2015, 2, 2, 2, 2, 2) do
          GenerateNewRota.perform_later("date_params", procurement_area.id, user.id)
        end
      end

      it "creates a failed journal entry" 


      it "does not put the rota slots into the database" 

    end
  end
end

