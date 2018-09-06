# frozen_string_literal: true

require 'feature_spec_helper'

describe 'Catalog facets' do
  let(:patricia) { create(:alias, display_name: 'Patricia M Hswe',
                                  agent: Agent.new(given_name: 'Patricia M', sur_name: 'Hswe')) }
  let(:patricia_with_dot) { create(:alias, display_name: 'Patricia M. Hswe',
                                           agent: Agent.new(given_name: 'Patricia M.', sur_name: 'Hswe')) }
  let(:patricia_caps) { create(:alias, display_name: 'PATRICIA M. HSWE',
                                       agent: Agent.new(given_name: 'PATRICIA M.', sur_name: 'HSWE')) }

  let(:work1) { build(:public_work, id: '1',
                                    contributor: ['Contri B. Utor'],
                                    publisher: ['Pu B. Lisher'],
                                    keyword: ['Key. Word.']) }
  let(:work2) { build(:public_work, id: '2',
                                    contributor: ['CONTRI B. UTOR'],
                                    publisher: ['PU B. LISHER'],
                                    keyword: ['KEY. WORD.']) }
  let(:work3) { build(:public_work, id: '3',
                                    contributor: ['Contri B Utor'],
                                    publisher: ['Pu B Lisher'],
                                    keyword: ['Key Word']) }

  before do
    work1.creators = [patricia_with_dot]
    work2.creators = [patricia_caps]
    work3.creators = [patricia]
    index_works_and_collections(work1, work2, work3)
    visit '/catalog'
    click_link('Creator')
  end

  it 'displays case and punctuation-corrected facets' 

end

