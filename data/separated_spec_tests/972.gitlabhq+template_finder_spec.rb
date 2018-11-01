require 'spec_helper'

describe TemplateFinder do
  using RSpec::Parameterized::TableSyntax

  describe '#build' do
    let(:project) { build_stubbed(:project) }

    where(:type, :expected_class) do
      :dockerfiles    | described_class
      :gitignores     | described_class
      :gitlab_ci_ymls | described_class
      :licenses       | ::LicenseTemplateFinder
    end

    with_them do
      subject(:finder) { described_class.build(type, project) }

      it { is_expected.to be_a(expected_class) }
      it { expect(finder.project).to eq(project) }
    end
  end

  describe '#execute' do
    where(:type, :vendored_name) do
      :dockerfiles    | 'Binary'
      :gitignores     | 'Actionscript'
      :gitlab_ci_ymls | 'Android'
    end

    with_them do
      it 'returns all vendored templates when no name is specified' 


      it 'returns only the specified vendored template when a name is specified' 


      it 'returns nil when an unknown name is specified' 

    end
  end
end

