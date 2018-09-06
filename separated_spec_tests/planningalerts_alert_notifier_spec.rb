require 'spec_helper'

describe AlertNotifier do
  before :each do
    @alert = create(:alert, email: "matthew@openaustralia.org", address: "24 Bruce Rd, Glenbrook NSW 2773",
      lat: 1.0, lng: 2.0, radius_meters: 800)
    allow(@alert).to receive(:confirm_id).and_return("abcdef")
    @original_emails_sent = Stat.emails_sent
    @original_applications_sent = Stat.applications_sent
    location1 = double("Location", lat: 0.1, lng: 0.2)
    @a1 = mock_model(Application, address: "Foo Street, Bar", council_reference: "a1", description: "Knock something down", id: 1,
        lat: location1.lat, lng: location1.lng, location: location1)
    location2 = double("Location", lat: 0.3, lng: 0.4)
    @a2 = mock_model(Application, address: "Bar Street, Foo", council_reference: "a2", description: "Put something up", id: 2,
        lat: location2.lat, lng: location2.lng, location: location2)
    @a3 = mock_model(Application, address: "2 Foo Parade, Glenbrook NSW 2773", id: 3)
    @c1 = create(:comment, text: "I think this is a great idea", name: "Matthew Landauer", application: @a3, id: 1)
    @c2 = create(:comment, name: "Jack Smith", application: @a3, id: 2, text: <<-EOF
Carles typewriter officia, cillum ethical elit swag. Consequat cillum yr wes anderson. 3 wolf moon blog iphone, pickled irure skateboard mcsweeney's seitan keffiyeh wayfarers. Jean shorts sriracha sed laborum. Next level forage flexitarian id. Mixtape sriracha sartorial beard ut, salvia adipisicing veniam wayfarers bushwick ullamco 8-bit incididunt. Scenester excepteur dreamcatcher, truffaut organic placeat esse post-ironic carles cupidatat nihil butcher sartorial fanny pack lo-fi.

Cillum ethnic single-origin coffee labore, sriracha fixie jean shorts freegan. Odd future aesthetic tempor, mustache bespoke gastropub dolore polaroid salvia helvetica. Kogi chambray cardigan sunt single-origin coffee. Cardigan echo park master cleanse craft beer. Carles sunt selvage, beard gastropub artisan chillwave odio VHS street art you probably haven't heard of them gentrify mixtape aesthetic. Salvia chambray anim occupy echo park est. Pork belly sint post-ironic ennui, PBR vero culpa readymade cardigan laboris.
    EOF
    )
  end

  describe "when sending a planning alert with one new comment" do
    let(:email) { AlertNotifier.alert("default", @alert, [], [@c1])}

    it "should use the singular in the comment line" 


    it "should have the unsubscribe header" 

  end

  describe "when sending a planning alert with two new comments" do
    let(:email) { AlertNotifier.alert("default", @alert, [], [@c1, @c2])}

    it "should use the plural in the comment line" 


    it "should nicely format (in text) a list of multiple planning applications" 


    it "should nicely format (in HTML) a list of multiple planning applications" 

  end

  describe "when send a planning alert with one new comment and two new planning applications" do
    let(:email) { AlertNotifier.alert("default", @alert, [@a1, @a2], [@c1])}

    it "should tell you about both in the comment line" 


    it "should nicely format (in text) a list of multiple planning applications" 


    it "should nicely format (in HTML) a list of multiple planning applications" 

  end

  describe "when sending a planning alert with one new planning application" do
    before :each do
      @email = AlertNotifier.alert("default", @alert, [@a1])
    end

    it "should use the singular (application) in the subject line" 

  end

  describe "when sending a planning alert with two new planning applications" do
    context "and the theme is Default" do
      before :each do
        @email = AlertNotifier.alert("default", @alert, [@a1, @a2])
      end

      it "should be sent to the user's email address" 


      it "should be from the main planningalerts email address" 


      it "should have a sensible subject line" 


      it "should be a multipart email" 


      context "Text email" do
        it "should nicely format a list of multiple planning applications" 

      end

      context "HTML emails" do
        before :each do
          @html_body = @email.html_part.body.to_s
        end

        it 'should contain links to the applications' 


        it 'should contain application descriptions' 


        it "should have a specific body" 

      end
    end

    context "and the theme is NSW" do
      before :each do
        @email = AlertNotifier.alert("nsw", @alert, [@a1, @a2])
      end

      # TODO This is just a temporary address
      it "should be from the nsw theme’s email address" 


      context "Text email" do
        it "should nicely format a list of multiple planning applications" 

      end

      context "HTML email" do
        before :each do
          @html_body = @email.html_part.body.to_s
        end

        it 'should contain links to the applications' 


        it "should have a specific body" 

      end
    end
  end

  describe ".new_signup_attempt_notice" do
    it "puts the address in the subject" 


    it "tells the user that we’ve recieved a new signup attempt" 

  end
end

