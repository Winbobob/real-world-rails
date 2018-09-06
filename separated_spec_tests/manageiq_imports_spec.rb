describe TaskHelpers::Imports do
  describe '.validate_source' do
    before do
      @import_dir = Dir.mktmpdir('miq_imp_dir')
      @import_dir2 = Dir.mktmpdir('miq_imp_dir')
      FileUtils.remove_entry @import_dir2
      @import_file = Tempfile.new('miq_imp_file')
    end

    after do
      FileUtils.remove_entry @import_dir
      @import_file.close!
    end

    it 'is a directory and readable' 


    it 'is a file and readable' 


    it 'does not exist' 


    it 'is a directory not readable' 


    it 'is a file not readable' 

  end
end

