describe ReportsController do
  let(:user) { create(:user, client_slug: "test") }

  before do
    login_as(user)
  end

  describe "#index" do
    it "shows list of reports" 

  end

  describe "#show" do
    it "shows a single report details" 

  end

  describe "#create" do
    it "creates new report" 

  end

  describe "#destroy (html)" do
    it "HTML content type responds with redirect" 

  end

  describe "#destroy (json)" do
    it "JSON content type responds with JSON payload" 

  end

  describe "#preview", :elasticsearch do
    it "sends email with report to current user", :email do
      my_report = create(:report, user: user)
      es_execute_with_retries 3 do
        post :preview, id: my_report.id
        expect(response.status).to eq 302
        expect(deliveries.size).to eq 1
      end
    end
  end
end

