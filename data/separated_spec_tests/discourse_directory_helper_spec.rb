require 'rails_helper'
require_dependency 'directory_helper'

describe DirectoryHelper do
  class DummyClass
    include DirectoryHelper
  end
  let(:helper) { DummyClass.new }

  before do
    helper.tmp_directory('prefix')
    helper.tmp_directory('other_prefix')
  end

  after do
    helper.remove_tmp_directory('prefix')
    helper.remove_tmp_directory('other_prefix')
  end

  describe '#tmp_directory' do
    it 'is memoized by prefix' 

  end

  describe '#remove_tmp_directory' do
    it 'removes the prefixed directory from the filesystem' 

  end
end

