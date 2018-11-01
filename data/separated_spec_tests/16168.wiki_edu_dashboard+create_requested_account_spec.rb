# frozen_string_literal: true

require 'rails_helper'

describe CreateRequestedAccount do
  let(:creator) { create(:admin) }
  let(:course) { create(:course) }
  let(:user) { create(:user) }
  let(:requested_account) do
    create(
      :requested_account,
      course_id: course.id,
      username: user.username,
      email: 'email@example.com'
    )
  end

  let(:subject) do
    described_class.new(requested_account, creator)
  end

  it 'creates the requested accounts' 


  it 'destroys the requested account if the username already exist' 


  it 'logs an error and keeps the requested account when unexpected responses' 

end

