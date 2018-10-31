require "#{Rails.root}/db/chores/csv_user_importer"

describe CsvUserImporter do
  around (:each) do |test|
    @temp_file = Tempfile.new("temp_file.csv")
    test.run
    @temp_file.close unless @temp_file.closed?
    @temp_file.unlink
  end

  describe 'header guessing' do
    it 'makes reasonable guesses when column names are sensical' 


    it "doesn't explode if the column names can't be determined" 

  end

  describe '#process_rows' do
    it 'creates the appropriate users' 


    it 'does not explode on an empty email field' 

  end
end

