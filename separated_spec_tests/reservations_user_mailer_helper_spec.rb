# frozen_string_literal: true
require 'spec_helper'

describe UserMailerHelper, type: :helper do
  before(:each) do
    @app_configs = double(department_name: 'dept', terms_of_service: 'tos')
    @reservation = double(id: 1, reserver: double(name: 'name'),
                          equipment_model: double(name: 'em', late_fee: 100,
                                                  replacement_fee: 200),
                          start_date: Time.zone.today,
                          due_date: Time.zone.today + 1.day)
  end

  context '.replace_variables' do
    it 'returns an empty string when no body is passed' 


    it 'replaces @user@ with the reserver name' 


    it 'replaces @reservation_id@ with the reservation id' 


    it 'replaces @department_name@ with the department name' 


    it 'replaces @equipment_list@ with the equipment model name' 


    it 'replaces @return_date@ with the due date' 


    it 'replaces @start_date@ with the start date' 


    it 'replaces @late_fee@ with the equipment model late fee rate' 


    it 'replaces @replacement_fee@ with the equipment model replacement fee' 


    it 'replaces @tos@ with the terms of service' 

  end
end

