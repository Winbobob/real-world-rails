require 'rails_helper'
include AsyncHelper

describe FastAssignWorker, type: :worker do
  include_context "Unit Assignments Variables"
  let!(:unit) {create(:unit, name: unit_template1.name, user_id: teacher.id)}

  context 'creates a new unit' do
    it "can create new units and classroom activities" 

  end

  context 'updates an existing unit' do
    it "does not duplicate the existing unit" 


    it "and adds new classroom activities to the existing unit" 


    it "that assigns the new activities to all students" 

  end


end

