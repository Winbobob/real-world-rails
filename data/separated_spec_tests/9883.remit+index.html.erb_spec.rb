require "rails_helper"
require "support/devise"

RSpec.describe "home/index.html.erb", type: :view do
  before do
    @studies = FactoryGirl.create_list(:study, 10)
    # The view expects to be able to paginate the the list of studies
    @studies = Kaminari.paginate_array(@studies).page(1).per(10)
    assign(:studies, @studies)
    @study_types = []
    @study_topics = []
    @countries = {}
    @operating_centers = Study::OPERATING_CENTER
    assign(:flagged_studies_count, 0)
    @selected_study_stages = []
    @selected_study_types = []
    @selected_study_topics = []
    @selected_countries = []
    @selected_operating_centers = []
    render
  end

  it "shows the study titles" 


  it "shows the study stage labels" 


  it "shows the study stage descriptions" 


  it "shows the study types" 


  it "shows the PI when there is one" 


  it "shows the country when there is one" 


  it "shows multiple countries when there are many" 


  context "when the user is logged in" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      render
    end

    it "shows 'Your studies' tab" 


    it "shows 'Studies you're following' tab" 

  end

  context "when the user isn't logged in" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_out :user
      render
    end

    it "doesn't show 'Your studies' tab" 


    it "doesn't show 'Studies you're following' tab" 

  end
end

