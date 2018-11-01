describe Api::V1::NoticesController, type: 'controller' do
  context "when logged in" do
    before do
      @user = Fabricate(:user)
    end

    describe "GET /api/v1/notices" do
      before do
        Fabricate(:notice, created_at: Time.zone.parse('2012-08-01'))
        Fabricate(:notice, created_at: Time.zone.parse('2012-08-01'))
        Fabricate(:notice, created_at: Time.zone.parse('2012-08-21'))
        Fabricate(:notice, created_at: Time.zone.parse('2012-08-30'))
      end

      it "should return JSON if JSON is requested" 


      it "should return XML if XML is requested" 


      it "should return JSON by default" 


      describe "given a date range" do
        it "should return only the notices created during the date range" 

      end

      it "should return all notices" 

    end
  end
end

