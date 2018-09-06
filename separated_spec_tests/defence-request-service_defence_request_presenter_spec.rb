require "rails_helper"

RSpec.describe DefenceRequestPresenter do
  subject { DefenceRequestPresenter.new client, defence_request }
  let(:client) { double("APIClient") }
  let(:defence_request) { FactoryGirl.build :defence_request }

  def self.defence_request_states_without_queued_and_acknowledged
    DefenceRequest.available_states.map(&:to_s) - ["queued", "acknowledged"]
  end

  describe "state_updated_time" do
    let(:timestamp) { Time.parse("2015/01/01 14:51:31") }
    let(:defence_request) { FactoryGirl.build :defence_request, state_updated_at: timestamp }

    it "formats the state_updated_at timestamp" 

  end

  describe "state_text" do
    it "returns the state_class capitalized" 

  end

  describe "state_class" do
    context "defence_request state is queued" do
      let(:defence_request) { FactoryGirl.build :defence_request, :queued }

      it "returns \"submitted\"" 

    end

    context "defence_request state is acknowledged" do
      let(:defence_request) { FactoryGirl.build :defence_request, :acknowledged }

      it "returns \"submitted\"" 

    end

    defence_request_states_without_queued_and_acknowledged.each do |state|
      context "defence_request state is #{state}" do
        let(:defence_request) { FactoryGirl.build :defence_request, state.to_sym }

        it "returns the same state: \"#{state}\"" 

      end
    end
  end
end

