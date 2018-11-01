# frozen_string_literal: true

describe StatusMessageCreationService do
  describe "#create" do
    let(:aspect) { alice.aspects.first }
    let(:text) { "I'm writing tests" }
    let(:params) {
      {
        status_message: {text: text},
        aspect_ids:     [aspect.id.to_s]
      }
    }

    it "returns the created StatusMessage" 


    context "with aspect_ids" do
      it "creates aspect_visibilities for the StatusMessages" 


      it "does not create aspect_visibilities if the post is public" 


      it "raises exception if aspects_ids don't contain any applicable aspect identifiers" 

    end

    context "with public" do
      it "it creates a private StatusMessage by default" 


      it "it creates a private StatusMessage" 


      it "it creates a public StatusMessage" 

    end

    context "with location" do
      it "it creates a location" 


      it "does not add a location without location params" 

    end

    context "with poll" do
      it "it creates a poll" 


      it "does not add a poll without poll params" 

    end

    context "with photos" do
      let(:photo1) {
        alice.build_post(:photo, pending: true, user_file: File.open(photo_fixture_name), to: aspect.id).tap(&:save!)
      }
      let(:photo2) {
        alice.build_post(:photo, pending: true, user_file: File.open(photo_fixture_name), to: aspect.id).tap(&:save!)
      }
      let(:photo_ids) { [photo1.id.to_s, photo2.id.to_s] }

      it "it attaches all photos" 


      it "does not attach photos without photos param" 


      context "with aspect_ids" do
        it "it marks the photos as non-public if the post is non-public" 


        it "creates aspect_visibilities for the Photo" 


        it "does not create aspect_visibilities if the post is public" 


        it "sets pending to false on any attached photos" 

      end

      context "with public" do
        it "it marks the photos as public if the post is public" 


        it "sets pending to false on any attached photos" 

      end
    end

    context "dispatch" do
      it "dispatches the StatusMessage" 


      it "dispatches the StatusMessage to services" 


      context "with mention" do
        let(:text) { text_mentioning(eve) }

        # this is only required until changes from #6818 are deployed on every pod
        it "filters out mentions from text attribute" 

      end
    end
  end
end

