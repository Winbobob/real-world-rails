# encoding: utf-8
require 'minitest/autorun'
require 'set'
require_relative '../../spec_helper'
require_relative '../../../backend/redis'
require_relative '../../../repository'

include DataRepository

describe Backend::Redis do
  before do
    @connection = Redis.new
    @connection.select 8
    @connection.flushdb

    storage     = Backend::Redis.new(@connection)
    @repository = Repository.new(storage)
  end

  describe '#store' do
    it 'persists a data structure in the passed key' 


    it 'stringifies symbols in the persisted data structe' 


    it 'sets key expiration in seconds if expiration option passed' 

  end #store

  describe '#fetch' do
    it 'retrieves a data structure from a key' 


    it 'returns nil if key does not exist' 

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
end # Backend::Redis


