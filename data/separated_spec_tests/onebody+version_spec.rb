require 'rails_helper'

describe Version do
  describe '.from_string' do
    context 'given 3.4.0' do
      let(:version) { Version.from_string('3.4.0') }

      it 'sets major to 3' 


      it 'sets minor to 4' 


      it 'sets patch to 0' 


      it 'sets special to nil' 

    end

    context 'given 3.4.0-pre' do
      let(:version) { Version.from_string('3.4.0-pre') }

      it 'sets special to "pre"' 

    end
  end

  describe '<=>' do
    context 'given 3.4.0 and 3.4.0-pre' do
      let(:version) { Version.from_string('3.4.0') }

      it 'returns +1' 

    end

    context 'given 3.4.0 and 3.5.0-pre' do
      let(:version) { Version.from_string('3.4.0') }

      it 'returns -1' 

    end

    context 'given 3.4.0 and 3.5.0' do
      let(:version) { Version.from_string('3.4.0') }

      it 'returns -1' 

    end
  end

  describe '#to_s' do
    context 'given 3.4.0' do
      let(:version) { Version.from_string('3.4.0') }

      it 'returns 3.4.0' 

    end

    context 'given 3.4.0-pre' do
      let(:version) { Version.from_string('3.4.0-pre') }

      it 'returns 3.4.0-pre' 

    end
  end
end

