require 'listen/silencer/controller'

RSpec.describe Listen::Silencer::Controller do
  let(:silencer) { instance_double(Listen::Silencer) }

  describe 'append_ignores' do
    context 'with no previous :ignore rules' do
      subject do
        described_class.new(silencer, {})
      end

      before do
        allow(silencer).to receive(:configure).with({})
      end

      context 'when providing a nil' do
        it 'sets the given :ignore rules as empty array' 

      end

      context 'when providing a single regexp as argument' do
        it 'sets the given :ignore rules as array' 

      end

      context 'when providing multiple arguments' do
        it 'sets the given :ignore rules as a flat array' 

      end

      context 'when providing as array' do
        it 'sets the given :ignore rules' 

      end
    end

    context 'with previous :ignore rules' do
      subject do
        described_class.new(silencer, ignore: [/foo/, /bar/])
      end

      before do
        allow(silencer).to receive(:configure).with(ignore: [/foo/, /bar/])
      end

      context 'when providing a nil' do
        # TODO: should this invocation maybe reset the rules?
        it 'reconfigures with existing :ignore rules' 

      end

      context 'when providing a single regexp as argument' do
        it 'appends the given :ignore rules as array' 

      end

      context 'when providing multiple arguments' do
        it 'appends the given :ignore rules as a flat array' 

      end

      context 'when providing as array' do
        it 'appends the given :ignore rules' 

      end
    end
  end
end

