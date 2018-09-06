require "spec_helper"

describe QueryHandler do

  let(:sut){ QueryHandler }

  before do
    allow($stdout).to receive(:puts).and_return(nil)
  end

  context "Single Query" do

    it "Returns a successful Query" 


    it "Returns false on Failed Query" 


  end

  context "Chaining Queries" do

    it "Returns the successful Query" 

    
    it "Returns the first successful Query" 


    it "Returns false if all Queries fail" 


    it "Ignore Subsequent Queries on good Query" 

  end

  context "Logging" do

    context "Default" do

      it "Logs Errors to STDOUT" 

    end

    context "Custom Logger" do

      class CustomLogger
        def log(exception); end
      end

      let(:logger){ CustomLogger.new }
      
      before do
        allow(logger).to receive(:log)

        sut.set_logger do |error|
          logger.log(error)
        end
      end

      it "Logs to the Custom Logger" 

    end
  end
end

