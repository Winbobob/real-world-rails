describe QA::Runtime::Env do
  include Support::StubENV

  describe '.chrome_headless?' do
    context 'when there is an env variable set' do
      it 'returns false when falsey values specified' 


      it 'returns true when anything else specified' 

    end

    context 'when there is no env variable set' do
      it 'returns the default, true' 

    end
  end

  describe '.running_in_ci?' do
    context 'when there is an env variable set' do
      it 'returns true if CI' 


      it 'returns true if CI_SERVER' 

    end

    context 'when there is no env variable set' do
      it 'returns true' 

    end
  end

  describe '.user_type' do
    it 'returns standard if not defined' 


    it 'returns standard as defined' 


    it 'returns ldap as defined' 


    it 'returns an error if invalid user type' 

  end
end

