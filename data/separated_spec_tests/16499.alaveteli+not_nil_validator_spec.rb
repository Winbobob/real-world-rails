# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Validatable
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :subject_attr

  validates :subject_attr, :not_nil => true
end

class ValidatableCustomMessage
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :subject_attr

  validates :subject_attr, :not_nil => { :message => 'Custom message' }
end

describe NotNilValidator do

  it 'is valid when the subject_attr is not blank' 


  it 'is valid when the subject_attr is blank' 


  it 'is invalid when the subject_attr is nil' 


  it 'sets a default error message' 


  it 'supports a custom error message' 


end

