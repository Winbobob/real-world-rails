require 'spec_helper'

describe Gitlab::GitalyClient::WikiService do
  let(:project) { create(:project) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:client) { described_class.new(project.repository) }
  let(:commit) { create(:gitaly_commit) }
  let(:page_version) { Gitaly::WikiPageVersion.new(format: 'markdown', commit: commit) }
  let(:page_info) { { title: 'My Page', raw_data: 'a', version: page_version } }

  describe '#find_page' do
    let(:response) do
      [
        Gitaly::WikiFindPageResponse.new(page: Gitaly::WikiPage.new(page_info)),
        Gitaly::WikiFindPageResponse.new(page: Gitaly::WikiPage.new(raw_data: 'b'))
      ]
    end
    let(:wiki_page) { subject.first }
    let(:wiki_page_version) { subject.last }

    subject { client.find_page(title: 'My Page', version: 'master', dir: '') }

    it 'sends a wiki_find_page message' 


    it 'concatenates the raw data and returns a pair of WikiPage and WikiPageVersion' 

  end

  describe '#get_all_pages' do
    let(:page_2_info) { { title: 'My Page 2', raw_data: 'c', version: page_version } }
    let(:response) do
      [
        Gitaly::WikiGetAllPagesResponse.new(page: Gitaly::WikiPage.new(page_info)),
        Gitaly::WikiGetAllPagesResponse.new(page: Gitaly::WikiPage.new(raw_data: 'b')),
        Gitaly::WikiGetAllPagesResponse.new(end_of_page: true),
        Gitaly::WikiGetAllPagesResponse.new(page: Gitaly::WikiPage.new(page_2_info)),
        Gitaly::WikiGetAllPagesResponse.new(page: Gitaly::WikiPage.new(raw_data: 'd')),
        Gitaly::WikiGetAllPagesResponse.new(end_of_page: true)
      ]
    end
    let(:wiki_page_1) { subject[0].first }
    let(:wiki_page_1_version) { subject[0].last }
    let(:wiki_page_2) { subject[1].first }
    let(:wiki_page_2_version) { subject[1].last }

    subject { client.get_all_pages }

    it 'sends a wiki_get_all_pages message' 


    it 'concatenates the raw data and returns a pair of WikiPage and WikiPageVersion for each page' 

  end
end

