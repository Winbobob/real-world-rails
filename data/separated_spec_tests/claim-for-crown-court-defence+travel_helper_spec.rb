RSpec.describe CaseWorkers::TravelHelper do
  subject { helper }

  it { is_expected.to respond_to :link_to_map }

  describe '#link_to_map' do
    subject(:link) do
      Nokogiri::HTML.fragment(helper.link_to_map('Test my link', origin: 'SE9 2XX', destination: 'SE9 3XX', target: '_blank')).
        search('a').
        first
    end

    it 'sets text of link' 


    it 'sets href attribute to google api with matching params' 


    it 'sets target of link' 


    it 'passes other html options to link_to' 

  end
end

