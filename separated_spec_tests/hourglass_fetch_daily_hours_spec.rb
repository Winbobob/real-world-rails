describe FetchDailyHours do
  let(:harvest) { double(Harvest::HardyClient) }
  let(:harvest_time) { double(Harvest::API::Time) }

  before do
    allow(Harvest).to receive(:hardy_client).with(
      subdomain: ENV["HARVEST_SUBDOMAIN"],
      username: ENV["HARVEST_USERNAME"],
      password: ENV["HARVEST_PASSWORD"]
    ) { harvest }

    allow(harvest).to receive(:time).with(no_args) { harvest_time }
  end

  it "creates a day with today's hours for every user" 


  it "updates existing days' hours for today" 


  it "accepts a specified date" 


  it "notes whether a user is tracking in real time" 


  it "doesn't fetch hours for inactive users" 

end

