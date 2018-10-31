require 'rails_helper'

describe ErrorDetailCollection do

  let(:edc)         { ErrorDetailCollection.new }
  let(:ed2) { ErrorDetail.new(:first_name, 'You must specify a first name', 'Cannot be blank','You must specify a first name',20) }
  let(:ed1) { ErrorDetail.new(:dob, 'Date of birth is invalid', 'Invalid date','Date of birth is invalid',10) }
  let(:ed3) { ErrorDetail.new(:dob, 'Date of birth too far in the past', 'Too old','Date of birth too far in the past',30) }

  context 'assign a single values to a key' do
    it 'should make an array containing the single object' 

  end

  context 'assign multiple values to a key' do
    it 'should make an array containing all the objects assigned' 

  end

  describe 'short_messagas_for' do
    context 'one short_message per key' do
      it 'should return the short message for the named key' 

    end

    context 'multiple short messages per key' do
      it 'should return a comma separated lit of messages for the named key' 

    end
  end

  describe 'header_errors' do
    let(:expected_headers_array) { [ed1, ed2, ed3] }
    before (:each) do
      edc[:first_name] = ed2
      edc[:dob] = ed1
      edc[:dob] = ed3
    end

    it 'should return an array of arrays containing feildname and long message for each error' 


    it 'should sort the array of errors by specified sequence' 

  end

  describe 'size' do
    context 'empty collection' do
      it 'should return zero' 

    end

    context 'several fieldnames, one error per fieldname' do
      it 'should return the number of errors' 

    end

    context 'several fieldnames, some with multiple errors' do
      it 'should return the total number of errors' 

    end

  end

end

