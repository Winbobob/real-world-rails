# frozen_string_literal: true

require 'fast_spec_helper'

RSpec.describe Quality::HelmClient do
  let(:namespace) { 'review-apps-ee' }
  let(:release_name) { 'my-release' }
  let(:raw_helm_list_page1) do
    <<~OUTPUT
    {"Next":"review-6709-group-t40qbv",
      "Releases":[
        {"Name":"review-qa-60-reor-1mugd1", "Revision":1,"Updated":"Thu Oct  4 17:52:31 2018","Status":"FAILED", "Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-7846-fix-s-261vd6","Revision":1,"Updated":"Thu Oct  4 17:33:29 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-7867-snowp-lzo3iy","Revision":1,"Updated":"Thu Oct  4 17:22:14 2018","Status":"DEPLOYED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-rename-geo-o4a780","Revision":1,"Updated":"Thu Oct  4 17:14:57 2018","Status":"DEPLOYED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-5781-opera-0k93fx","Revision":1,"Updated":"Thu Oct  4 17:06:15 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-6709-group-2pzeec","Revision":1,"Updated":"Thu Oct  4 16:36:59 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-ce-to-ee-2-l554mn","Revision":1,"Updated":"Thu Oct  4 16:27:02 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-epics-e2e-m690eb","Revision":1,"Updated":"Thu Oct  4 16:08:26 2018","Status":"DEPLOYED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-7126-admin-06fae2","Revision":1,"Updated":"Thu Oct  4 15:56:35 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"},
        {"Name":"review-6983-promo-xyou11","Revision":1,"Updated":"Thu Oct  4 15:15:34 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"}
      ]}
    OUTPUT
  end
  let(:raw_helm_list_page2) do
    <<~OUTPUT
    {"Releases":[
      {"Name":"review-6709-group-t40qbv","Revision":1,"Updated":"Thu Oct  4 17:52:31 2018","Status":"FAILED","Chart":"gitlab-1.1.3","AppVersion":"master","Namespace":"#{namespace}"}
    ]}
    OUTPUT
  end

  subject { described_class.new(namespace: namespace) }

  describe '#releases' do
    it 'raises an error if the Helm command fails' 


    it 'calls helm list with default arguments' 


    it 'calls helm list with extra arguments' 


    it 'returns a list of Release objects' 


    it 'automatically paginates releases' 

  end

  describe '#delete' do
    it 'raises an error if the Helm command fails' 


    it 'calls helm delete with default arguments' 

  end
end

