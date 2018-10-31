# frozen_string_literal: true

require 'rails_helper'

describe ManageAction do
  let(:page) { create :page }
  let(:member) { create :member }
  let(:found_action) { Action.where(member: member, page: page).first }

  subject { ManageAction.create(page_id: page.id, email: member.email) }

  context 'with existing member' do
    it 'increments cache counter with new_member as false' 


    it 'does not create a new member' 


    it 'does not create a new member if the email address is not lower case' 

  end

  context 'with new member' do
    subject { ManageAction.create(page_id: page.id, email: 'new@example.com') }

    it 'increments cache counter with new_member as true' 


    it 'creates a new member' 

  end

  it 'enqueues action' 


  it 'correctly finds the expected page' 


  it 'correctly builds and returns actions' 


  it 'correctly builds and finds previous actions' 


  describe 'previous_action' do
    let!(:page2) { create :page }
    let!(:page3) { create :page }
    let!(:page4) { create :page }
    let(:mab) { ManageAction.new(page_id: page.id, email: member.email) }

    it 'returns nil if no previous action on any page' 


    it 'returns nil if previous action on another page' 


    it 'returns nil if previous action on another page in a different campaign' 


    it 'returns action on current page if one exists' 


    it 'returns action on other page in campaign if one campaign' 


    it 'returns action on other page in campaign if multiple campaigns' 

  end

  it 'passes unknown attrs through to form_data' 


  describe 'donor_status' do
    let(:params) { { page_id: page.id, email: member.email } }

    describe 'when member is nondonor' do
      it 'it starts as nondonor' 


      it 'stays nondonor when action is not donation' 


      it 'becomes donor when action is non-recurring donation' 


      it 'becomes recurring_donor when action is recurring donation' 

    end

    describe 'when member is donor' do
      before :each do
        member.donor!
      end

      it 'starts as donor' 


      it 'stays donor when action is not donation' 


      it 'stays donor when action is non-recurring donation' 


      it 'becomes recurring_donor when action is recurring donation' 

    end

    describe 'when member is recurring_donor' do
      before :each do
        member.recurring_donor!
      end

      it 'starts as recurring_donor' 


      it 'stays recurring_donor when action is not donation' 


      it 'stays recurring_donor when action is non-recurring donation' 


      it 'stays recurring_donor when action is recurring donation' 

    end
  end

  describe 'action_referrer_email' do
    let(:base_params) { { page_id: page.id, email: member.email } }
    let(:akid) { '1234.5678.tKK7gX' }
    let(:ak_user_id) { akid.split('.')[1] }

    describe 'is not added if rid' do
      it 'is not included' 


      it 'is blank' 


      it "is an id of a member that doesn't exist" 


      it 'is an id of a member with no email' 

    end

    it 'is added to form_data if rid is the id of a member' 


    it 'is added to form_data if referring_akid has the ak_user_id of a member' 


    it 'adds the email of a matching rid if both rid and referring_akid are present' 


    it 'adds the email of a matching referrer_id if both rid and referrer_id are present' 

  end
end

