# encoding: utf-8
require 'minitest/autorun'
require 'stringio'
require_relative '../../../filesystem/local'

include DataRepository::Filesystem

describe Local do
  before do
    @data   = StringIO.new(Time.now.to_f.to_s)
    @path   = File.join( (0..2).map { Time.now.to_f.to_s } )
    @prefix = File.join(Local::DEFAULT_PREFIX, Time.now.to_i.to_s)
  end

  after do
    @data.close
    FileUtils.rmtree(@prefix)
    FileUtils.rmtree(Local::DEFAULT_PREFIX)
  end

  describe '#initialize' do
    it 'sets the storage prefix to Local::DEFAULT_PREFIX by default' 

  end #initialize

  describe '#store' do
    it 'stores data in the specified path' 

  end #store

  describe '#fetch' do
    it 'retrieves data from the specified path' 

  end #fetch
end # Local


