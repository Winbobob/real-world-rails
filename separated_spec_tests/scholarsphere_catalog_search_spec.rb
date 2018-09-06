# frozen_string_literal: true

require 'feature_spec_helper'

describe 'catalog searching', type: :feature do
  let(:user)   { create(:jill) }

  let!(:work1) { build(:public_work, id: 'pw1',
                                     depositor: user.login,
                                     title: ['title 1'],
                                     description: ['first work'],
                                     date_created: ['just now'],
                                     keyword: ['tag1', 'tag2']) }

  let!(:work2) { build(:public_work, id: 'pw2',
                                     depositor: user.login,
                                     title: ['title 2'],
                                     description: ['second work'],
                                     date_created: ['just now'],
                                     keyword: ['tag2', 'tag3']) }

  let!(:work3) { build(:public_work, id: 'pw3',
                                     depositor: user.login,
                                     title: ['title 3'],
                                     date_created: ['just now'],
                                     keyword: ['tag3', 'tag4']) }

  let!(:collection) { build(:collection, id: 'coll1', depositor: user.login, keyword: ['tag3', 'tag4']) }

  before do
    index_works_and_collections(work1, work2, work3, collection)
    sign_in(user)
    visit '/'
  end

  it 'shows the facets' 


  it 'finds multiple files' 


  it 'finds files and collections' 


  it 'finds collections' 

end

