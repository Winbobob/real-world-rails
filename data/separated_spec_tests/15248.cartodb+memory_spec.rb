# encoding: utf-8
require 'minitest/autorun'
require 'ostruct'
require_relative '../../spec_helper'
require_relative '../../../repository'
require_relative '../../../backend/memory'

include DataRepository

describe Repository do
  before do
    @repository = Repository.new(Backend::Memory.new)
  end

  describe '#store' do
    it 'persists a data structure in the passed key' 


    it 'stringifies symbols in the persisted data structure' 

  end #store

  describe '#fetch' do
    it 'retrieves a data structure from a key' 

  end #fetch

  describe '#delete' do
    it 'deletes a key' 

  end #delete

  describe '#keys' do
    it 'returns all stored keys, stringified' 

  end #keys

  describe '#exists?' do
    it 'returns if key exists' 

  end #exists?
end # Repository


