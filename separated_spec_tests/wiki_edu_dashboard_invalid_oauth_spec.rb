# frozen_string_literal: true

require 'rails_helper'

describe 'a user with invalid oauth credentials', type: :feature do
  before do
    user = create(:user, wiki_token: 'invalid')
    login_as user
  end

  it 'should get logged out and see a message about the problem' 

end

describe 'a user whose oauth credentials expire', type: :feature do
  let(:admin)  { create(:admin) }
  let(:course) { create(:course, end: 1.year.from_now, submitted: true) }

  it 'is logged out upon visiting a course' 

end

