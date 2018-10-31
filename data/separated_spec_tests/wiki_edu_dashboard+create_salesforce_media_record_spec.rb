# frozen_string_literal: true

require 'rails_helper'

describe CreateSalesforceMediaRecord do
  let(:course) { create(:course, flags: { salesforce_id: 'a2qQ0101015h4HF' }) }
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:subject) do
    described_class.new(
      course: course,
      user: user,
      article: article,
      before_rev_id: 1234,
      after_rev_id: 3456
    )
  end

  it 'calls #create! on the Restforce client and returns a url' 

end

