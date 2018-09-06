describe TaskHelpers::Exports do
  describe '.safe_filename' do
    it 'should return a filename without spaces' 


    it 'should return a filename with spaces' 


    it 'should return a filename without / or spaces' 


    it 'should return a filename without / and with spaces' 


    it 'should return a filename without | or spaces' 


    it 'should return a filename without | and with spaces' 


    it 'should return a filename without /,  | or spaces' 


    it 'should not create duplicate filenames' 

  end

  describe '.validate_directory' do
    let(:export_dir2) { Dir.tmpdir + "/thisdoesntexist" }

    before do
      @export_dir = Dir.mktmpdir('miq_exp_dir')
    end

    after do
      FileUtils.remove_entry @export_dir
    end

    it 'is a directory and writable' 


    it 'does not exist' 


    it 'is not writable' 

  end

  describe '.exclude_attributes' do
    let(:all_attributes) do
      { "id"         => 1,
        "name"       => "EvmRole-super_administrator",
        "read_only"  => true,
        "created_at" => Time.zone.now,
        "updated_at" => Time.zone.now,
        "settings"   => nil }
    end

    it 'removes selected attributes' 

  end
end

