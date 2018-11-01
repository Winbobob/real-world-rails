describe QA::Runtime::API::Client do
  include Support::StubENV

  describe 'initialization' do
    it 'defaults to :gitlab address' 


    it 'uses specified address' 

  end

  describe '#personal_access_token' do
    context 'when QA::Runtime::Env.personal_access_token is present' do
      before do
        allow(QA::Runtime::Env).to receive(:personal_access_token).and_return('a_token')
      end

      it 'returns specified token from env' 

    end

    context 'when QA::Runtime::Env.personal_access_token is nil' do
      before do
        allow(QA::Runtime::Env).to receive(:personal_access_token).and_return(nil)
      end

      it 'returns a created token' 

    end
  end
end

