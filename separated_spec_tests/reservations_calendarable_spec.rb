# frozen_string_literal: true

require 'spec_helper'

shared_examples_for 'calendarable' do |model|
  before(:each) do
    sign_in FactoryGirl.create(:admin)
    @obj = FactoryGirl.create(model.to_s.underscore.to_sym)
    @res = send("gen_#{model.to_s.underscore}_res".to_sym, @obj)
    @res2 = send("gen_#{model.to_s.underscore}_res".to_sym)
  end

  context 'GET calendar' do
    before { get :calendar, params: { id: @obj } }

    it 'stores instance variables' 

    it 'responds with HTML' 

  end

  context 'GET calendar dates' do
    it 'defaults to +/- 6 months' 


    it 'uses start and end' 


    it 'uses calendar[start_date] and calendar[end_date]' 

  end

  context 'GET calendar JSON' do
    before { get :calendar, params: { format: :json, id: @obj } }

    it 'stores reservations for the object correctly' 

    it 'stores other instance variables' 

    it 'responds with JSON' 

  end

  context 'GET calendar ICS' do
    before { get :calendar, params: { format: :ics, id: @obj } }

    it 'stores reservations for the object correctly' 

    it 'stores other instance variables' 


    it 'responds with ICS format' 

  end
end

def gen_user_res(user = nil)
  user ||= FactoryGirl.create(:user)
  gen_res(user)
end

def gen_category_res(cat = nil)
  cat ||= FactoryGirl.create(:category)

  gen_equipment_model_res(nil, cat)
end

def gen_equipment_model_res(em = nil, cat = nil)
  opts = cat ? { category: cat } : {}

  em ||= FactoryGirl.create(:equipment_model, opts)

  gen_equipment_item_res(nil, em)
end

def gen_equipment_item_res(ei = nil, em = nil)
  opts = em ? { equipment_model: em } : {}

  ei ||= FactoryGirl.create(:equipment_item, opts)

  gen_res(nil, ei)
end

def gen_res(user = nil, ei = nil)
  return if ei && ei.equipment_model.nil? # check for invalid ei

  ei ||= FactoryGirl.create(:equipment_item)
  user ||= FactoryGirl.create(:user)

  FactoryGirl.create(:valid_reservation, equipment_item: ei, reserver: user,
                                         equipment_model: ei.equipment_model)
end

