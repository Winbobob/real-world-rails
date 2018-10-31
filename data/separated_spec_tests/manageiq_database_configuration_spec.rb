describe "DatabaseConfiguration patch" do
  let(:db_config_path) { File.expand_path "../../../config/database.yml", __dir__ }
  let(:fake_db_config) { Pathname.new("does/not/exist") }

  before do
    allow(ManageIQ).to receive_messages(:env => ActiveSupport::StringInquirer.new("production"))

    @app = Vmdb::Application.new
    @app.config.paths["config/database"] = fake_db_config.to_s # ignore real database.yml
  end

  context "ERB in the template" do
    before do
      database_config = StringIO.new "---\nvalue: <%= 1 %>\n"
      allow(database_config).to receive(:exist?).and_return(true)
      allow(Pathname).to receive(:new).and_return(database_config)
    end

    it "doesn't execute" 

  end

  context "when DATABASE_URL is set" do
    around(:each) do |example|
      begin
        old_env = ENV.delete('DATABASE_URL')
        ENV['DATABASE_URL'] = 'postgres://'
        example.run
      ensure
        # ENV['x'] = nil deletes the key because ENV accepts only string values
        ENV['DATABASE_URL'] = old_env
      end
    end

    it "ignores a missing file" 

  end

  context "with no source of configuration" do
    it "explains the problem" 

  end
end

