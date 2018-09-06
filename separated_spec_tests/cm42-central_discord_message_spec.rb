require 'rails_helper'

describe DiscordMessage do
  let(:project) { double(:project, name: 'Central') }

  let(:model) do
    double(
      :model,
      project: project,
      base_uri: 'http://foo.com/projects/123',
      id: 2,
      title: 'Sample',
      state: 'started',
      owned_by_name: 'Mike',
      estimate: 1
    )
  end

  subject { described_class.new(model) }

  describe '#message' do
    it 'returns message' 

  end
end

