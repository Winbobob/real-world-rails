require 'spec_helper'

describe AssignmentService do
  let(:minister) { build(:minister) }

  let(:form) {
    CommissionForm.new({
      pq_id: pq.id,
      minister_id: minister.id,
      action_officer_id: [action_officer.id],
      date_for_answer: Date.tomorrow,
      internal_deadline: Date.today
    })
  }

  let(:directorate) {create(:directorate, name: 'This Directorate', id: 1+rand(10))}
  let(:division) {create(:division,name: 'Division', directorate_id: directorate.id, id: 1+rand(10))}
  let(:deputy_director) { create(:deputy_director, name: 'dd name', division_id: division.id, id: 1+rand(10))}
  let(:action_officer) { create(:action_officer, name: 'ao name 1', email: 'ao@ao.gov', deputy_director_id: deputy_director.id) }
  let(:commissioning_service) { CommissioningService.new }

  let(:pq) { create(:pq, uin: 'HL789', question: 'test question?',minister:minister, house_name:'commons') }

  before(:each) do
    ActionMailer::Base.deliveries = []
  end

  let(:assignment) { ActionOfficersPq.new(action_officer: action_officer, pq: pq) }

  describe '#accept' do
    it 'accepts the assignment' 


    it 'sets pq state to DRAFT_PENDING' 


    it 'should sent an email with the accept data' 


    it 'should set the original division_id on PQ' 


    it 'should set the original directorate on PQ' 


    it 'should set the directorate on acceptance and not change if AO moves' 

  end

  describe '#reject' do
    let(:reason) { double(reason_option: 'reason option', reason: 'Some reason') }

    it 'rejects the assignment' 


    it 'updates progress' 


  end
end

