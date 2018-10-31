describe Cache::Cacheable do
  class TestCacheable
    extend Cache::Cacheable
    include ClassLogger
    def self.cache_key id
      id
    end
  end

  let(:randkey) { rand(99999).to_s }

  context 'regular fetch' do
    context 'with nil values' do
      describe '#fetch_from_cache' do
        before do
          expect(Rails.cache).to receive(:write).once.with(randkey, NilClass, anything).and_call_original
          expect(Rails.cache).to receive(:fetch).twice.with(randkey, anything).and_call_original
        end
        it 'translates nil' 

      end
    end
  end

  context 'smart fetch' do
    context 'with normal hash values' do
      let(:normal_hash) { {foo: 'bar'} }
      context 'when no exceptions occur' do
        before do
          expect(Rails.cache).to receive(:read).twice.with(randkey).and_call_original
          expect(Rails.cache).to receive(:write).once.with(
                                   randkey,
                                   normal_hash,
                                   {expires_in: Settings.cache.expiration.default, force: true}
                                 ).and_call_original
        end
        it 'caches a hash' 

      end

      context 'when forcing a write' do
        let(:new_hash) { {blah: 'bonk'} }
        before do
          expect(Rails.cache).not_to receive(:read)
          expect(Rails.cache).to receive(:write).twice.with(
                                   randkey,
                                   an_instance_of(Hash),
                                   {expires_in: Settings.cache.expiration.default, force: true}
                                 ).and_call_original
        end
        it 'always writes to cache when force is on' 

      end

      context 'when jsonification has been requested' do
        before do
          expect(Rails.cache).to receive(:read).once.with(randkey).and_call_original
          expect(Rails.cache).to receive(:write).once.with(
                                   randkey,
                                   normal_hash.to_json,
                                   {expires_in: Settings.cache.expiration.default, force: true}
                                 ).and_call_original
        end
        it 'converts input to json and caches that' 

      end

      context 'when an exception occurs' do
        let(:error_response) { {body: 'An unknown server error occurred', statusCode: 503} }
        before do
          expect(Rails.cache).to receive(:read).once.with(randkey).and_call_original
          expect(Rails.cache).to receive(:write).once.with(
                                   randkey,
                                   error_response,
                                   {expires_in: Settings.cache.expiration.failure, force: true}
                                 ).and_call_original
        end
        it 'returns a friendlier error response on exceptions' 

      end
    end

    context 'with nil values' do
      before do
        expect(Rails.cache).to receive(:read).twice.with(randkey).and_call_original
        expect(Rails.cache).to receive(:write).once.with(
                                 randkey,
                                 NilClass,
                                 {expires_in: Settings.cache.expiration.default, force: true}
                               ).and_call_original
      end
      it 'caches a nil' 

    end

    context 'with nil values and jsonification' do
      before do
        expect(Rails.cache).to receive(:read).twice.with(randkey).and_call_original
        expect(Rails.cache).to receive(:write).once.with(
                                 randkey,
                                 'null',
                                 {expires_in: Settings.cache.expiration.default, force: true}
                               ).and_call_original
      end
      it 'caches a nil with jsonification' 

    end
  end

  describe '#expires_in' do
    before do
      allow(Time).to receive(:now).and_return(Time.zone.parse(fake_now).to_time)
      allow(Settings.cache.expiration).to receive(:marshal_dump).and_return({TestCacheable: fake_setting, default: 1 })
    end
    describe 'next day' do
      let(:fake_setting) {'NEXT_00_01'}
      let(:fake_now) {'2014-09-02 11:01'}
      it 'returns the start of the next day' 

    end
    describe 'next campus refresh' do
      let(:fake_setting) {'NEXT_08_00'}
      context 'early in morning' do
        let(:fake_now) {'2014-09-02 06:00'}
        it 'returns later today' 

      end
      context 'later in day' do
        let(:fake_now) {'2014-09-02 09:00'}
        it 'returns tomorrow morning' 

      end
      context 'exactly at expiration time' do
        let(:fake_now) {'2014-09-02 08:00'}
        it 'returns tomorrow morning' 

      end
    end
  end

end


