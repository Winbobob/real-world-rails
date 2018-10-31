# frozen_string_literal: true

require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe AgentsController do
  context 'a logged in user' do
    let(:user) { create(:user, display_name: 'First User') }
    let(:jamie) { create(:agent, given_name: 'Jamie', sur_name: 'Test', email: 'james@gmail.com', psu_id: 'jtt01', orcid_id: '1234') }
    let(:sally) { create(:agent, given_name: 'Sally', sur_name: 'James') }
    let(:sal) { create(:agent, given_name: 'Sal', sur_name: 'Anderson') }

    let(:ldap_attrs) { %i[uid givenname sn mail eduPersonPrimaryAffiliation displayname] }

    let(:jamie_l_franks_ldap_entry) do
      build(:ldap_entry,
            uid: 'qjf1',
            displayname: 'JAMIE L FRANKS',
            givenname: 'JAMIE L',
            sn: 'FRANKS',
            mail: 'qjf1@psu.edu')
    end
    let(:jamie_test_gmail_ldap_entry) do
      build(:ldap_entry,
            uid: 'jat1',
            displayname: 'JAMIE TEST',
            givenname: 'Jamie',
            sn: 'Test',
            mail: 'james@gmail.com')
    end
    let(:jamie_test_psu_ldap_entry) do
      build(:ldap_entry,
            uid: 'jat1',
            displayname: 'JAMIE TEST',
            givenname: 'Jamie',
            sn: 'Test',
            mail: 'jat1@psu.edu')
    end

    let(:janet_mouse_ldap_entry) do
      build(:ldap_entry,
            uid: 'jam',
            displayname: 'JANET A MOUSE',
            givenname: 'JANET A',
            sn: 'MOUSE',
            mail: 'jam@psu.edu')
    end

    let(:name_results) { [jamie_l_franks_ldap_entry,
                          jamie_test_gmail_ldap_entry,
                          jamie_test_psu_ldap_entry] }

    let(:mail_results) { [janet_mouse_ldap_entry, jamie_test_psu_ldap_entry] }

    let(:jamie_t_name_results) { [jamie_test_psu_ldap_entry] }

    let(:jamie_t_mail_results) { [] }

    describe 'GET name_search' do
      before do
        Alias.destroy_all && Agent.destroy_all
        create(:alias, display_name: 'Jamie Test', agent: jamie)
        create(:alias, display_name: 'Dr. James T. Test', agent: jamie)
        create(:alias, display_name: 'Sally James', agent: sally)
        create(:alias, display_name: 'Sal Anderson', agent: sal)
        allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
        allow_any_instance_of(User).to receive(:groups).and_return(['registered'])
      end
      it 'returns JSON search based on the first name & last name' 

      it 'returns JSON results when queried with spaces' 

    end
  end
end

