require 'spec_helper'

describe Morph::DockerUtils do
  describe '.create_tar' do
    it 'should preserve the symbolic link' 


    it 'should have an encoding of ASCII-8BIT' 

  end

  describe '.extract_tar' do
    it 'should do the opposite of create_tar' 

  end

  describe '.fix_modification_times' do
    it do
      Dir.mktmpdir do |dir|
        FileUtils.touch(File.join(dir, 'foo'))
        FileUtils.mkdir_p(File.join(dir, 'bar'))
        FileUtils.touch(File.join(dir, 'bar', 'twist'))
        Morph::DockerUtils.fix_modification_times(dir)
        expect(File.mtime(dir)).to eq Time.new(2000, 1, 1)
        expect(File.mtime(File.join(dir, 'foo'))).to eq Time.new(2000, 1, 1)
        expect(File.mtime(File.join(dir, 'bar'))).to eq Time.new(2000, 1, 1)
        expect(File.mtime(File.join(dir, 'bar', 'twist')))
          .to eq Time.new(2000, 1, 1)
      end
    end
  end

  describe '.copy_directory_contents' do
    it 'should copy a file in the root of a directory' 


    it 'should copy a directory and its contents' 


    it 'should copy a file starting with .' 

  end

  describe '.find_all_containers_with_label', docker: true do
    before :each do
      Morph::DockerUtils.find_all_containers_with_label('foobar').each do |c|
        c.delete
      end
    end
    after :each do
      Morph::DockerUtils.find_all_containers_with_label('foobar').each do |c|
        c.delete
      end
    end
    it 'should find no containers with a particular label initially' 


    it 'should find two containers with the particular label when I create then' 

  end

  describe '.copy_file' do
    it 'should create a temporary file locally from a file on a container' 


    it 'should return nil for a file that does not exist' 

  end
end

