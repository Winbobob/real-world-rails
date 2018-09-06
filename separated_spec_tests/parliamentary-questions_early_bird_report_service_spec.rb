require 'spec_helper'

describe 'EarlyBirdReportService' do

  let!(:early_bird_one) { create(:early_bird_member, name: 'member 1', email: 'm1@ao.gov',  deleted: false) }
  let!(:early_bird_two) { create(:early_bird_member, name: 'member 2', email: 'm2@ao.gov', deleted: false) }
  let!(:early_bird_deleted) { create(:early_bird_member, name: 'member 3', email: 'm3@ao.gov', deleted: true) }
  let(:testid) { "early_bird-" + DateTime.now.to_s }

  before(:each) do
    @report_service               = EarlyBirdReportService.new
    ActionMailer::Base.deliveries = []
  end

  it 'should have generated a valid token' 



    it 'should send an email with the right data' 



  it 'should add the people from the Early Bird to the CC' 

end

