require 'rails_helper'

describe 'POST /api/v0/tokens' do
  it 'returns a 401 and no token when auth fails' 


  it 'returns token on success' 


  private

  def parsed_response
    JSON.parse(response.body)
  end
end

