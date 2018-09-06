describe VMDB::Util do
  context ".http_proxy_uri" do
    it "without config settings" 


    it "returns proxy for old settings" 


    it "without a host" 


    it "with host" 


    it "with host, port" 


    it "with host, port, user" 


    it "with host, port, user, password" 


    it "with user missing" 


    it "with unescaped user value" 


    it "with scheme overridden" 

  end

  context ".log_duration" do
    shared_examples_for "log_duration timestamps" do |file_content, type|
      it "#{file_content.lines.count} lines, #{type == :normal_case ? 'normal case' : 'no leading timestamps'}" 

    end

    line_with_timestamp    = "[2010-08-06T15:36:54.000749 #62084:3fd3c5833be0]\n"
    line_with_timestamp2   = "[2013-08-06T15:36:54.000749 #62084:3fd3c5833be0]\n"
    line_without_timestamp = "line with no timestamps\n"

    include_examples "log_duration timestamps", (line_with_timestamp * 500) + (line_with_timestamp2 * 500), :normal_case
    include_examples "log_duration timestamps", (line_without_timestamp * 199) + line_with_timestamp
    include_examples "log_duration timestamps", (line_without_timestamp * 249) + line_with_timestamp
    include_examples "log_duration timestamps", (line_without_timestamp * 250) + line_with_timestamp
    include_examples "log_duration timestamps", (line_without_timestamp * 251) + line_with_timestamp
  end

  context ".zip_entry_from_path (private)" do
    before do
      allow(Rails).to receive(:root).and_return(Pathname.new("/var/www/miq/vmdb"))
    end

    def self.assert_zip_entry_from_path(expected_entry, path)
      it "#{path} => #{expected_entry}" 

    end

    assert_zip_entry_from_path("ROOT/var/log/messages.log", "/var/log/messages.log")
    assert_zip_entry_from_path("log/evm.log", "/var/www/miq/vmdb/log/evm.log")
    assert_zip_entry_from_path("ROOT/www/var/vmdb/miq/log/something.log", "/www/var/vmdb/miq/log/something.log")
    assert_zip_entry_from_path("log/apache/ssl_access.log", "/var/www/miq/vmdb/log/apache/ssl_access.log")
    assert_zip_entry_from_path("config/database.yml", "/var/www/miq/vmdb/config/database.yml")
    assert_zip_entry_from_path("GUID", "/var/www/miq/vmdb/GUID")
  end

  context ".add_zip_entry(private)" do
    require 'zip/filesystem'
    let(:origin_file) { Tempfile.new 'origin' }
    let(:symlink_level_1) { create_temp_symlink 'symlink_level_1', origin_file.path }
    let(:symlink_level_2) { create_temp_symlink 'symlink_level_2', symlink_level_1 }
    let(:mtime) { origin_file.mtime }
    let(:ztime) { Zip::DOSTime.at(mtime.to_i) }
    let(:zip) { double }
    let(:zip_file) { double }

    it "entry is a normal file" 


    it "entry is a symlink to origin file, origin file is added with symlink's name" 


    it "entry is a symlink to symlink to origin file, origin file is added with symlink's name" 


    after do
      origin_file.close
      origin_file.unlink
    end
  end

  it ".get_evm_log_for_date" 


  private

  def create_temp_symlink(name, origin)
    symlink_file = Tempfile.new name
    symlink_file.close
    symlink_name = symlink_file.path
    symlink_file.unlink
    FileUtils.ln_s origin, symlink_name
    symlink_name
  end
end

