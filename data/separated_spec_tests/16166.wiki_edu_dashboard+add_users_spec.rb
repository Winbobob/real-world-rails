# frozen_string_literal: true

require 'rails_helper'

describe AddUsers do
  let(:course) { create(:course) }
  let(:existing_user) { create(:user, username: 'Ragesoss') }
  let(:normalized_username) { 'John of Reading' }
  let(:nonnormalized_username) { 'ursos_clio_herodoto' }
  let(:nonexistent_username) { 'This Is Not a Real User' }
  let(:usernames_list) do
    [existing_user.username, normalized_username, nonnormalized_username, nonexistent_username]
  end

  before do
    course.campaigns << Campaign.first
  end

  let(:subject) do
    described_class.new(course: course, usernames_list: usernames_list)
  end

  it 'returns all submitted usernames, and normalizes the ones that exist' 

end

