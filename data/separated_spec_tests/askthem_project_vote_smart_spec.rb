require 'spec_helper'

describe ProjectVoteSmart do
  let(:api) { ProjectVoteSmart.new }

  describe '#office_ids' do
    it 'returns Chairman and Councilmember ids if dc' 


    it 'returns State Assembly and State House ids if lower chamber' 


    it 'returns state senate id if not dc and lower chamber' 


    it 'returns federal senate id if state us and upper chamber' 


    it 'returns federal house id if state us and lower chamber' 

  end

  describe '#officials_by_state_and_office' do
    it 'returns officials for state and office', :vcr do
      expect(api.officials_by_state_and_office('vt', [9]).first).to eq first_vt_state_senator
    end

    it 'returns federal officials for office when state is us', :vcr do
      expect(api.officials_by_state_and_office('us', [6]).first).to eq first_us_senator
    end
  end

  describe '#get' do
    it 'returns results from Project Vote Smart api', :vcr do
      results = api.get('Officials.getByOfficeState',
                        officeId: 9,
                        stateId: 'VT')

      expect(results.first).to eq first_vt_state_senator
    end
  end

  def first_vt_state_senator
    {"candidateId"=>"80645", "firstName"=>"Timothy", "nickName"=>"Tim", "middleName"=>"R.", "preferredName"=>"Timothy", "lastName"=>"Ashe", "suffix"=>"", "title"=>"Senator", "ballotName"=>"", "electionParties"=>"", "electionStatus"=>"", "electionStage"=>"", "electionDistrictId"=>"", "electionDistrictName"=>"", "electionOffice"=>"", "electionOfficeId"=>"", "electionStateId"=>"", "electionOfficeTypeId"=>"", "electionYear"=>"", "electionSpecial"=>"", "electionDate"=>"", "officeParties"=>"Democratic, Progressive", "officeStatus"=>"active", "officeDistrictId"=>"27137", "officeDistrictName"=>"Chittenden", "officeStateId"=>"VT", "officeId"=>"9", "officeName"=>"State Senate", "officeTypeId"=>"L", "runningMateId"=>"", "runningMateName"=>""}
  end

  def first_us_senator
    {"candidateId"=>"15691","firstName"=>"Lamar","nickName"=>"","middleName"=>"","preferredName"=>"Lamar","lastName"=>"Alexander","suffix"=>"","title"=>"Senator","ballotName"=>"","electionParties"=>"","electionStatus"=>"","electionStage"=>"","electionDistrictId"=>"","electionDistrictName"=>"","electionOffice"=>"","electionOfficeId"=>"","electionStateId"=>"","electionOfficeTypeId"=>"","electionYear"=>"","electionSpecial"=>"","electionDate"=>"","officeParties"=>"Republican","officeStatus"=>"active","officeDistrictId"=>"20533","officeDistrictName"=>"Sr","officeStateId"=>"TN","officeId"=>"6","officeName"=>"U.S. Senate","officeTypeId"=>"C","runningMateId"=>"","runningMateName"=>""}
  end
end

