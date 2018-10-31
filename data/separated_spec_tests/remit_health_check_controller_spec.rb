require "rails_helper"

RSpec.describe HealthCheckController, type: :controller do
  describe "delayed study alerts health check" do
    it "returns true if there are no delayed studies" 


    it "returns true if there are delayed studies which have been alerted" 


    it "returns false if delayed studies haven't been alerted" 


    it "ignores other sent alerts for the study" 


    it "gives delayed studies a day's grace" 

  end

  describe "erb approval expiring alerts health check" do
    it "returns true if there are no expiring studies" 


    it "returns true if there are expiring studies which have been alerted" 


    it "returns false if expiring studies haven't been alerted" 


    it "ignores other sent alerts for the study" 


    it "gives expiring studies a day's grace" 

  end

  describe "erb response overdue alerts health check" do
    it "returns true if there are no overdue studies" 


    it "returns true if there are overdue studies which have been alerted" 


    it "returns false if overdue studies haven't been alerted" 


    it "ignores other sent alerts for the study" 


    it "gives overdue studies a day's grace" 

  end

  describe "summarising health checks" do
    it "returns a 200 when all the checks are healthy" 


    it "returns a 500 when any check is unhealthy" 

  end
end

