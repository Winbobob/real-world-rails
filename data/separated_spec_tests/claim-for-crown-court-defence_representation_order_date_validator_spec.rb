require 'rails_helper'

RSpec.describe RepresentationOrderValidator, type: :validator do
  let(:claim)     { build :claim }
  let(:defendant) { build :defendant, claim: claim }
  let(:reporder)  { build :representation_order, defendant: defendant }

  before do
    claim.force_validation = true
  end

  context 'representation_order_date' do
    it { should_error_if_not_present(reporder, :representation_order_date, "blank") }
    it { should_error_if_in_future(reporder, :representation_order_date, "in_future") }
    it { should_error_if_too_far_in_the_past(reporder, :representation_order_date, "not_before_earliest_permitted_date") }
  end

  context 'for a litigator interim claim' do
    let(:claim) { build :interim_claim }

    context 'representation_order_date' do
      let(:earliest_permitted_date) { Date.new(2014,10,2) }
      it { should_error_if_before_specified_date(reporder, :representation_order_date, earliest_permitted_date, 'not_before_interim_earliest_permitted_date') }
    end
  end

  context 'stand-alone rep order' do
    it 'should always be valid if not attached to a defendant or claim' 

  end

  context 'multiple representation orders' do
    let(:claim) { create :claim }
    let(:ro1)   { claim.defendants.first.representation_orders.first }
    let(:ro2)   { claim.defendants.first.representation_orders.last }

    it 'should be valid if the second reporder is dated after the first' 


    it 'should be invalid if second reporder dated before first' 

  end
end

