require 'rails_helper'

RSpec.describe SlotsController, type: :controller do
  render_views

  before :each do
    Timecop.freeze(Time.local(2013, 12, 1, 12, 0))
    session[:visit] = Visit.new(
      visit_id: SecureRandom.hex,
      prisoner: Prisoner.new(prison_name: 'Cardiff'),
      visitors: [Visitor.new],
      slots: []
    )
    cookies['cookies-enabled'] = 1
  end

  after :each do
    Timecop.return
  end

  it_behaves_like "a browser without a session present"
  it_behaves_like "a session timed out"

  it "permits up to 3 slots to be selected" 


  context "correct slot information" do
    let(:slots_hash) do
      {
        visit: {
          slots: [
            {
              slot: '2013-01-01-1345-2000'
            }
          ]
        }
      }
    end

    it "permits us to select a time slot" 

  end

  context "no slots" do
    let(:slots_hash) do
      {
        visit: { slots: [{slot: ''}] }
      }
    end

    it "prompts us to retry" 

  end

  context "exactly three slots" do
    let(:slots_hash) do
      {
        visit: { slots: [{slot: '2013-01-01-1200-1300'}] * 3 }
      }
    end

    it "accepts the submission" 

  end

  context "exactly two slots" do
    let(:slots_hash) do
      {
        visit: { slots: [{slot: '2013-01-01-1200-1300'}] * 2 }
      }
    end

    it "accepts the submission" 

  end

  context "too many slots" do
    let(:slots_hash) do
      {
        visit: { slots: [{ slot: '2013-01-01-1200-1300' }] * 4 }
      }
    end

    it "prompts us to retry" 

  end
end

