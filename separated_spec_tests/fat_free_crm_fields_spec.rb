# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'FatFreeCRM::Fields' do
  class Foo
    include FatFreeCRM::Fields
    include ActiveModel::Validations
    has_fields
  end

  class Bar
    include FatFreeCRM::Fields
    include ActiveModel::Validations
  end

  it do
    expect(Foo.new).to respond_to(:field_groups)
  end

  it do
    expect(Foo).to respond_to(:serialize_custom_fields!)
  end

  it do
    expect(Foo).to respond_to(:fields)
  end

  it "calling has_fields should invoke serialize_custom_fields!" 


  describe "field_groups" do
    it "should call FieldGroup" 


    it "should not call FieldGroup if table doesn't exist (migrations not yet run)" 

  end

  describe "fields" do
    before(:each) do
      @f1 = double(Field)
      @f2 = double(Field)
      @f3 = double(Field)
      @field_groups = [double(FieldGroup, fields: [@f1, @f2]), double(FieldGroup, fields: [@f3])]
    end

    it "should convert field_groups into a flattened list of fields" 

  end

  describe "serialize_custom_fields!" do
    before(:each) do
      @f1 = double(Field, as: 'check_boxes', name: 'field1')
      @f2 = double(Field, as: 'date', name: 'field2')
    end

    it "should serialize checkbox fields as Array" 

  end

  it "should validate custom fields" 


  describe "custom_fields_validator" do
    before(:each) do
      @f1 = double(Field)
      @field_groups = [double(FieldGroup, fields: [@f1])]
    end

    it "should call custom_validator on each custom field" 

  end
end

