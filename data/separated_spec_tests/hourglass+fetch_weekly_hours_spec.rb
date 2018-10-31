describe FetchWeeklyHours do
  let(:harvest) { double(Harvest::HardyClient) }
  let(:harvest_time) { double(Harvest::API::Time) }

  before do
    Timecop.travel(Date.new(2015, 4, 28)) # Tuesday

    allow(Harvest).to receive(:hardy_client).with(
      subdomain: ENV["HARVEST_SUBDOMAIN"],
      username: ENV["HARVEST_USERNAME"],
      password: ENV["HARVEST_PASSWORD"]
    ) { harvest }

    allow(harvest).to receive(:time).with(no_args) { harvest_time }

    allow(harvest_time).to receive(:all) { [] }
  end

  it "creates days with hours for every day of this week, for every user" 

end

