require 'spec_helper'

describe Admin::CourtsController do
  before :each do
    @user = User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
    sign_in @user
    @court = create(:court, name: 'A court of Law')
  end

  it "displays a list of courts" 


  describe "#update" do
    let(:params) { { id: @court.id, court: { name: 'Another court of law' } } }

    context "that works" do
      before do
        Court.any_instance.stub(update_attributes: true)
      end

      context "a html request" do
        it "redirects to the edit path" 

      end

      context "a json request" do
        before { params[:format] = :json }

        it "responds with no content" 

      end
    end

    context "that doesn't work" do
      before do
        Court.any_instance.stub(update_attributes: false)
      end

      context "a html request" do
        context "with a redirect_url param" do
          before { params[:redirect_url] = 'http://some.com' }

          it "redirects to the given redirect_url" 

        end

        context "without a redirect_url param" do
          it "rerenders the edit template" 

        end
      end
      context "a json request" do
        before { params[:format] = :json }

        it "responds with unprocessable_entity" 

      end
    end

    context 'with invalid postcode_court' do
      let(:params) { { id: @court.id, court: { name: 'Another court of law', postcode_list: "N102LZ" } } }

      it "render_template" 

    end
  end

  describe "#create" do
    let(:params) { { court: { name: 'A court of LAW', latitude: 50, longitude: 0 } } }

    context "that works" do
      context "a html request" do
        it "redirects to the edit path" 

      end
      context "a json request" do
        before { params[:format] = :json }

        it "responds with created" 

      end
    end

    context "that doesn't work" do
      before do
        Court.any_instance.stub(save: false)
      end

      context "a html request" do
        it "rerenders the new template" 

      end
      context "a json request" do
        before { params[:format] = :json }

        it "responds with unprocessable_entity" 

      end
    end
  end

  it "remove record when destroyed" 


  describe "#new" do
    it "assigns a new court to @court" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  describe "#show" do
    let(:court) { Court.create(name: 'My Court') }

    it "finds the right court" 


    it "assigns the court" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  describe "#edit" do
    let(:court) { Court.create(name: 'My Court') }

    it "finds the right court" 


    it "assigns the court" 


    it "assigns the courts contacts in :sort order to @court_contacts" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

  end

  describe "#areas_of_law" do
    let(:court) { instance_double('Court', id: 2, remits: [remit]) }
    let(:remit) { instance_double('Remit', area_of_law_id: 3) }

    before do
      allow(Court).to receive(:by_name).and_return([court])
      allow(AreaOfLaw).to receive(:all).and_return('all areas of law')
    end
    it "gets one page of courts by name" 


    it "assigns the paginated courts by name to @courts" 


    it "gets all areas of law" 


    it "assigns all areas of law to @areas_of_law" 

  end

  describe "#court_types" do
    let(:mock_courts_by_name) { double('courts by name', paginate: 'paginated courts by name') }
    before do
      Court.stub(:by_name).and_return(mock_courts_by_name)
      CourtType.stub(:order).and_return('all court types')
    end
    it "gets one page of courts by name" 


    it "assigns the paginated courts by name to @courts" 


    it "gets all court types in name order" 


    it "assigns all court types to @court_types" 

  end

  describe "#civil" do
    before do
      Court.stub_chain(:by_area_of_law, :by_name, :paginate).and_return('courts')
    end
    it "assigns courts" 

  end

  describe '#family' do

    it 'assigns @courts' 


    it 'assigns @area_of_law' 


  end

  context "Audit" do
    before do
      PaperTrail.whodunnit = @user.id
    end

    it "returns the audit trail as a CSV file", versioning: true do
      get :audit, format: :csv
      response.should be_successful
    end

    it "audit trail csv returns correct information", versioning: true do
      @court.update_attributes!(name: "Amazing Court")
      get :audit, format: :csv
      response.body.should include "lol@biz.info,ip,Amazing Court,name,update,A court of Law,Amazing Court"
    end

    it "does not return the audit trail for a non super-admin user", versioning: true do
      sign_in User.create!(name: 'notadmin', admin: false, email: 'lolcoin@biz.info', password: 'irrelevant')
      get :audit, format: :csv
      response.should_not be_successful
    end
  end
end

