# encoding: utf-8
require_relative '../../lib/importer/source_file'

include CartoDB::Importer2

describe SourceFile do
  describe '#basename' do
    it 'returns the name without extension' 

  end #basename

  describe '#extension' do
    it 'returns the extension, if any' 

  end #extension

  describe '#fullpath' do
    it 'returns the full path' 

  end #fullpath

  describe '#path' do
    it 'returns the file name with extension' 

  end #path 

  describe '#target_schema' do
    it "returns 'cdb_importer'" 

  end #target_schema

  describe '#encoding' do
    it 'returns the encoding if embedded in the filepath' 


    it 'returns nil if no encoding embedded in the filepath' 

  end
end # SourceFile


