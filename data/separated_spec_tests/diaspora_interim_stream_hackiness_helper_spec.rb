# frozen_string_literal: true

describe InterimStreamHackinessHelper, type: :helper do
  describe "commenting_disabled?" do
    include Devise::Test::ControllerHelpers

    before do
      sign_in alice
      def user_signed_in?
        true
      end
    end

    it 'returns true if no user is signed in' 


    it 'returns true if @commenting_disabled is set' 


    it 'returns @stream.can_comment? if @stream is set' 

  end

  describe "#publisher_formatted_text" do
    it "returns the prefill text from the stream" 

  end
end

