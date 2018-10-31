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

  shared_examples "has basic logging functionality" do |logger_tested|
    subject       { logger_tested }
    let(:logger1) { subject }
    let(:logger2) { $container_log }

    before do
      allow($container_log.logdev).to receive(:write)
    end

    before(:all) do
      unless ENV['CONTAINER']
        logger_tested.extend(ActiveSupport::Logger.broadcast($container_log))
      end
    end

    it "responds to #<<" 


    it "responds to #debug" 


    it "responds to #info" 


    it "responds to #error" 


    it "responds to #fatal" 


    it "responds to #unknown" 


    describe "#datetime_format" do
      it "return nil" 


      it "does not raise an error" 

    end

    # Ripped from lib/vmdb/loggers/multicast_logger_spec.rb, but adapted used
    # in a integration spec fashion to test against all of the configured
    # loggers, and be idempotent with any of the settings that affect the
    # levels and number of loggers (always have the $container_log attached to
    # each of the logs tested here).
    context "#add" do
      context "for info logger levels" do
        around do |example|
          old_subject_level, subject.level = subject.level, 1
          example.run
          subject.level = old_subject_level
        end

        it "forwards to the other loggers" 

      end

      context "for higher logger levels" do
        around do |example|
          old_logger_1_level, logger1.level = logger1.level, 0
          old_subject_level, subject.level  = subject.level, 1
          example.run
          subject.level = old_subject_level
          logger1.level = old_logger_1_level
        end

        it "only forwards the message if the severity is correct" 

      end
    end

    context "#level=" do
      around do |example|
        old_subject_level, subject.level = subject.level, 0
        example.run
        subject.level = old_subject_level
      end

      it "updates the log level on all backing devices" 

    end

    context "#<<" do
      it "forwards to the other loggers" 

    end
  end

  context "for all multicast loggers" do
    [
      $log, $rails_log, $api_log, $miq_ae_logger, $aws_log, $azure_log,
      $cn_monitoring_log, $datawarehouse_log, $fog_log, $kube_log, $lenovo_log,
      $nuage_log, $policy_log, $rhevm_log, $scvmm_log, $vcloud_log, $vim_log,
      $websocket_log
    ].each do |logger|
      context "for the #{File.basename(logger.filename)}" do
        include_examples "has basic logging functionality", logger.dup
      end
    end
  end

  describe "#create_multicast_logger (private)" do
    it "defaults the loggers to the default level (INFO)" 


    it "does not broadcast to $container_log by default" 


    context "in a container environment" do
      around { |example| in_container_env(example) }

      it "sets logger_instance to INFO and $container_log to DEBUG" 


      it "broadcasts to $container_log and the base logger" 

    end
  end

  describe "#apply_config_value (private)" do
    before do
      allow($log).to receive(:info)
    end

    it "will update the main lower level logger instance" 


    context "in a container environment" do
      around { |example| in_container_env(example) }

      it "will always keep $container_log as DEBUG" 

    end
  end
end

