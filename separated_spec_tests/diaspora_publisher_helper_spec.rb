# frozen_string_literal: true

describe PublisherHelper, type: :helper do
  describe "#public_selected?" do
    it "returns true when the selected_aspects contains 'public'" 


    it "returns true when the publisher is set to public" 


    it "returns false when the selected_aspects does not contain 'public' and the publisher is not public" 


    it "returns false when the selected_aspects does not contain 'public' and there is no stream" 

  end

  describe "#all_aspects_selected?" do
    it "returns true when the selected_aspects are the same size as all_aspects from the user" 


    it "returns false when not all aspects are selected" 


    it "returns false when the user does not have aspects" 


    it "returns false when the publisher is set to public" 

  end

  describe "#aspect_selected?" do
    before do
      alice.aspects.create(name: "other")
      allow(helper).to receive(:all_aspects).and_return(alice.aspects.to_a)
    end

    it "returns true when the selected_aspects contains the aspect" 


    it "returns false when the selected_aspects does not contain the aspect" 


    it "returns false when all aspects are selected" 


    it "returns false when the publisher is set to public" 

  end
end

