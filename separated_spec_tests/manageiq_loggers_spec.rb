describe Vmdb::Loggers do
  let(:log_file) { Rails.root.join("log", "foo.log").to_s }

  def in_container_env(example)
    old_env = ENV.delete('CONTAINER')
    ENV['CONTAINER'] = 'true'
    example.run
  ensure
    # ENV['x'] = nil deletes the key because ENV accepts only string values
    ENV['CONTAINER'] = old_env
  end

  describe "#create_multicast_logger (private)" do
    it "defaults the lower level loggers to `DEBUG`" 


    context "in a container environment" do
      around { |example| in_container_env(example) }

      it "sets logger_instance and $container_log to debug" 

    end
  end

  describe "#apply_config_value (private)" do
    it "will update the main lower level logger instance" 


    context "in a container environment" do
      around { |example| in_container_env(example) }

      it "will always keep $container_log as DEBUG" 

    end
  end
end

