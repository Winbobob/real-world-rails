require 'rails_helper'

describe Api::SubscribeJobStatesController, type: :controller do

  before :each do
    @user = FactoryBot.create :user
    @job_state_1 = FactoryBot.build :subscribe_job_state, user_id: @user.id
    @job_state_2 = FactoryBot.build :subscribe_job_state, user_id: @user.id
    @user.subscribe_job_states << @job_state_1 << @job_state_2

    login_user_for_unit @user
  end

  context 'GET index' do

    it 'returns subscribe job state successfully' 


    it 'assigns the right job states' 


  end

  context 'GET show' do

    it 'assigns the right job state' 


    it 'returns a 404 for a job state that does not belong to the user' 


    it 'returns a 404 for a non-existing job state' 

  end

  context 'DELETE remove' do

    it 'returns 200' 


    it 'deletes the job state' 


    it 'returns 404 if the job state does not exist' 


    it 'returns 404 if the job state does not belong to the current user' 


    it 'returns 500 if there is a problem unsubscribing' 

  end

end

