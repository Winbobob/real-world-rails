require 'spec_helper'

# Note: These specs don't use Berkshelf code directly as this project doesn't
# have a direct dependency on Berkshelf and loading it would impact the
# perfance of these specs. While not ideal, the test doubles provide enough of
# a standin for Berkshelf to exercise the `#matches?` behavior.
describe ChefSpec::Coverage::BerkshelfFilter do
  let(:dependencies) do
    [double('Berkshelf::Dependency', metadata?: true, name: "cookbookery")]
  end
  let(:berksfile) { double('Berkshelf::Berksfile', dependencies: dependencies) }
  let(:resource) { Chef::Resource.new('theone') }
  subject { described_class.new(berksfile) }

  describe '#matches?' do
    it 'returns truthy if resource source_line is nil' 


    context 'when resource#source_line is under target cookbook' do
      it 'normal unix path returns truthy' 


      it 'normal windows path returns truthy' 


      it 'mixed windows path returns truthy' 

    end

    context 'when resource#source_line is not under target cookbook' do
      it 'normal unix path returns falsey' 


      it 'normal windows path returns falsey' 


      it 'mixed windows path returns falsey' 

    end
  end
end

