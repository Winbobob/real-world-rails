# frozen_string_literal: true

module QA
  shared_examples 'registration and login' do
    it 'user registers and logs in' 

  end

  context 'Manage', :skip_signup_disabled do
    describe 'standard' do
      it_behaves_like 'registration and login'
    end
  end

  context 'Manage', :orchestrated, :ldap_no_tls, :skip_signup_disabled do
    describe 'while LDAP is enabled' do
      it_behaves_like 'registration and login'
    end
  end
end

