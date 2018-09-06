describe MiqEnvironment do
  context "with linux platform" do
    before do
      @old_impl = Sys::Platform::IMPL
      silence_warnings { Sys::Platform::IMPL = :linux }
    end

    after do
      silence_warnings { Sys::Platform::IMPL = @old_impl } if @old_impl
    end

    context "Command" do
      context ".supports_memcached?" do
        it "should run once and cache the result" 

      end

      context ".supports_apache?" do
        it "should run once and cache the result" 

      end

      context ".supports_nohup_and_backgrounding?" do
        it "should run once and cache the result" 

      end

      context ".is_production?" do
        it "should return false if Rails undefined" 


        it "will return true if linux and /var/www/miq/vmdb exists and cache the result" 

      end

      describe ".is_container?" do
        it "returns false if the environment variable is not set" 


        it "returns true if the environment variable is set" 

      end
    end
  end

  def assert_same_result_every_time(method, expected)
    2.times { expect(MiqEnvironment::Command.send(method)).to eq(expected) }
  end
end

