# -*- coding: utf-8 -*-
require 'spec_helper'

describe FieldsController, :type => :controller do
  before :each do
    user = User.new(:user_name => 'manager_of_forms')
    allow(user).to receive(:roles).and_return([Role.new(:permissions => [Permission::FORMS[:manage]])])
    fake_login user
  end

  describe 'post create' do
    before :each do
      @field = Field.new :name => 'my_new_field', :type => 'TEXT', :display_name => 'My New Field'
      @form_section = FormSection.new :name => 'Form section 1', :unique_id => 'form_section_1'
      allow(FormSection).to receive(:get_by_unique_id).with(@form_section.unique_id).and_return(@form_section)
    end

    it 'should add the new field to the form_section' 


    it 'should redirect back to the fields page' 


    it 'should render edit form section page if field has errors' 


    it 'should show a flash message' 


    it 'should use the display name to form the field name if no field name is supplied' 


  end

  describe 'edit' do
    it 'should render form_section/edit template' 

  end

  describe 'post move_up and move_down' do
    before :each do
      @form_section_id = 'fred'
      @field_name = 'barney'
      @form_section = FormSection.new
      allow(FormSection).to receive(:get_by_unique_id).with(@form_section_id).and_return(@form_section)
    end

    it 'should save the given field in the same order as given' 


  end

  describe 'post toggle_fields' do

    before :each do
      @form_section_id = 'fred'
      @form_section = FormSection.new
      allow(FormSection).to receive(:get_by_unique_id).with(@form_section_id).and_return(@form_section)
    end

    it 'should toggle the given field attribute' 


    it 'should toggle the matchable field attribute' 

  end

  describe 'post update' do
    before { FormSection.all.each(&:destroy) }

    it 'should update all attributes on field at once and render edit form sections page' 


    it 'should display errors if field could not be saved' 


    it 'should move the field to the given form section' 


  end
end

