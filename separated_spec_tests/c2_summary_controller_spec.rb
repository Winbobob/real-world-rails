describe SummaryController do
  describe "#index" do
    describe "authorize" do
      it "blocks non-admins" 


      it "requires client_slug if the user is a client admin" 


      it "requires admin or client_admin or gateway_admin role" 

    end

    it "takes optional fiscal year" 


    describe "summaries" do
      context "when the user is a regular admin" do
        it "produces a summary for each client" 

      end

      context "when the user is a gateway admin" do
        it "produces a summary for each client" 

      end

      context "when the user is a client admin" do
        it "produces a single summary" 


        context "and the user is also a regular or gateway admin" do
          it "produces a summary for each client" 

        end
      end
    end
  end
end

