require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RespondWithMatcher, type: :controller do
  statuses = { success: 200, redirect: 301, missing: 404, error: 500,
    not_implemented: 501 }

  statuses.each do |human_name, numeric_code|
    context "a controller responding with #{human_name}" do
      it 'accepts responding with a numeric response code' 


      it 'accepts responding with a symbol response code' 


      it 'rejects responding with another status' 

    end
  end

  def controller_with_status(status)
    build_fake_response do
      render text: 'text', status: status
    end
  end
end

