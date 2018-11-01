describe Api::V1::ProblemsController, type: 'controller' do
  context "when logged in" do
    before do
      @user = Fabricate(:user)
    end

    describe "GET /api/v1/problems/:id" do
      before do
        notice = Fabricate(:notice)
        err = Fabricate(:err, notices: [notice])
        @problem = Fabricate(:problem, errs: [err])
      end

      it "should return JSON if JSON is requested" 


      it "should return XML if XML is requested" 


      it "should return JSON by default" 


      it "should return the correct problem" 


      it "should return only the correct fields" 


      it "returns a 404 if the problem cannot be found" 

    end

    describe "GET /api/v1/problems" do
      before do
        Fabricate(:problem, first_notice_at: Date.new(2012, 8, 01), resolved_at: Date.new(2012, 8, 02))
        Fabricate(:problem, first_notice_at: Date.new(2012, 8, 01), resolved_at: Date.new(2012, 8, 21))
        Fabricate(:problem, first_notice_at: Date.new(2012, 8, 21))
        Fabricate(:problem, first_notice_at: Date.new(2012, 8, 30))
      end

      it "should return JSON if JSON is requested" 


      it "should return XML if XML is requested" 


      it "should return JSON by default" 


      describe "given a date range" do
        it "should return only the problems open during the date range" 

      end

      it "should return all problems" 

    end
  end
end

