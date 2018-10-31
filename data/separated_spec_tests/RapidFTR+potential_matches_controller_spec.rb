require 'spec_helper'

describe Api::PotentialMatchesController, :type => :controller do
  before :each do
    PotentialMatch.all.each { |pm| pm.destroy }
    fake_field_worker_login
  end

  describe 'GET index' do
    it 'should fetch all the potential matches' 


    describe 'updated after' do

      it 'should return all the records created after a specified date' 


      it 'should decode URI encoded strings' 

    end
  end

  describe 'GET show' do
    it 'should authorize user' 


    it 'should authorize user' 

  end
end

