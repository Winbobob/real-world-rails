# encoding: utf-8
require 'fileutils'
require_relative '../../lib/importer/unp'
require_relative '../../../../spec/rspec_configuration.rb'

include CartoDB::Importer2

describe Unp do
  describe '#run' do
    it 'extracts the contents of the file' 


    it 'extracts the contents of a carto file (see #11954)' 


    it 'extracts the contents of a carto file with rar in the name (see #11954)' 


    it 'populates a list of source files' 


    it 'populates a single source file for the passed path if not compressed' 

  end

  describe '#without_unpacking' do
    it 'pushes a source file for the passed file path to the source files' 


    it 'raises if the path does not belong to a file' 

  end

  describe '#compressed?' do
    it 'returns true if extension denotes a compressed file' 

  end

  describe '#process' do
    it 'adds a source_file for the path if extension supported' 

  end

  describe '#crawl' do
    it 'returns a list of full paths for files in the directory' 

  end

  describe '#extract' do
    it 'generates a temporary directory' 


    it 'extracts the contents of the file into the temporary directory' 


    it 'raises if unp could not extract the file' 

  end

  describe '#source_file_for' do
    it 'returns a source_file for the passed path' 

  end

  describe '#command_for' do
    it 'returns the unp command line to be executed' 


    it 'raises if unp is not found' 

  end

  describe '#supported?' do
    it 'returns true if file extension is supported' 

  end

  describe '#normalize' do
    it 'underscores the file name' 


    it 'renames the file to the underscored file name' 

  end

  describe '#underscore' do
    it 'substitutes spaces for underscores in the file name' 


    it 'converts the file name to downcase' 

  end

  describe '#rename' do
    it 'renames a file' 


    it 'does nothing if destination file name is the same as the original' 

  end

  describe '#generate_temporary_directory' do
    it 'creates a temporary directory' 


    it 'sets the temporary_directory instance variable' 

  end

  describe '#hidden?' do
    it 'returns true if filename starts with a dot' 


    it 'returns true if filename starts with two underscores' 

  end

  describe '#unp_failure?'  do
    it 'returns true if unp cannot read the file' 


    it 'returns true if returned an error exit code' 

  end

  describe "configuration" do
    it "Uses a different configuration path if specified" 

  end

  def zipfile_factory(dir = '/var/tmp/bogus', filename: 'bogus.zip')
    zipfile = "#{dir}/#{filename}"

    FileUtils.rm(zipfile) if File.exists?(zipfile)
    FileUtils.rm_r(dir)   if File.exists?(dir)
    FileUtils.mkdir_p(dir)

    FileUtils.cp(File.join(File.dirname(__FILE__), "../fixtures/#{filename}"), zipfile)

    zipfile
  end
end

