# frozen_string_literal: true

require 'feature_spec_helper'

describe 'unified search', type: :feature do
  let(:subject_value) { 'fffzzz' }
  let(:user)          { create(:jill) }
  let(:other_user)    { create(:archivist) }

  let!(:file1) { create(:public_file, depositor: user.login, title: ['title 1 abc'], keyword: [subject_value]) }
  let!(:file2) { create(:private_file, depositor: user.login, title: ['title 2 abc'], keyword: [subject_value]) }
  let!(:file3) { create(:public_file, depositor: other_user.login, title: ['title 3 abc'], keyword: [subject_value]) }
  let!(:collection) do
    create(:public_collection,
           title: ['collection title abc'],
           description: [subject_value],
           user: user,
           members: [file1, file2])
  end

  context 'anonymous user' do
    it 'only searches all' 

  end
  context 'known user' do
    before do
      sign_in_with_js(user)
      visit('/')
    end
    it 'searches all' 

    it 'searches My Works' 

    it 'searches My Collections' 

  end
end

