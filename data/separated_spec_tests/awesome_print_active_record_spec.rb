require 'spec_helper'
require 'active_record_helper'

RSpec.describe 'AwesomePrint/ActiveRecord', skip: -> { !ExtVerifier.has_rails? }.call do
  describe 'ActiveRecord instance, attributes only (default)' do
    before do
      ActiveRecord::Base.default_timezone = :utc
      @diana = User.new(name: 'Diana', rank: 1, admin: false, created_at: '1992-10-10 12:30:00')
      @laura = User.new(name: 'Laura', rank: 2, admin: true,  created_at: '2003-05-26 14:15:00')
      @ap = AwesomePrint::Inspector.new(plain: true, sort_keys: true)
    end

    it 'display single record' 


    it 'display multiple records' 


    it 'display multiple records on a relation' 

  end

  describe 'Linked records (joins)' do
    before do
      @ap = AwesomePrint::Inspector.new(plain: true)
    end

    it 'should show the entire record' 

  end

  #------------------------------------------------------------------------------
  describe 'ActiveRecord instance (raw)' do
    before do
      ActiveRecord::Base.default_timezone = :utc
      @diana = User.new(name: 'Diana', rank: 1, admin: false, created_at: '1992-10-10 12:30:00')
      @laura = User.new(name: 'Laura', rank: 2, admin: true,  created_at: '2003-05-26 14:15:00')
      @ap = AwesomePrint::Inspector.new(plain: true, sort_keys: true, raw: true)
    end

    it 'display single record' 


    it 'display multiple records' 

  end

  #------------------------------------------------------------------------------
  describe 'ActiveRecord class' do
    before do
      @ap = AwesomePrint::Inspector.new(plain: true)
    end

    it 'should print the class' 


    it 'should print the class for non-direct subclasses of ActiveRecord::Base' 


    it 'should print ActiveRecord::Base objects (ex. ancestors)' 

  end

  #------------------------------------------------------------------------------
  describe 'ActiveRecord methods formatting' do
    before do
      @ap = AwesomePrint::Inspector.new(plain: true)
    end

    it 'should format class methods properly' 

  end
end

