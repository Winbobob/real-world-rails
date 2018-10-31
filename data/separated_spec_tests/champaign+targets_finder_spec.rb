# frozen_string_literal: true

require 'rails_helper'

describe EmailTool::TargetsFinder do
  let(:opts) {
    { postcode: 'BN1 ', endpoint: 'https://my-target-endpoint/targets' }
  }

  let(:representatives) { [{ first_name: 'Bob', last_name: 'Lib', email_1: 'bob@example.com' }] }

  before do
    allow(HTTParty).to receive(:get) { double(body: representatives.to_json) }
  end

  it 'GETs resource with correct postcode' 


  it 'returns formatted targets' 

end

