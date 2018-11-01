require 'spec_helper'

describe ClusterApplicationEntity do
  describe '#as_json' do
    let(:application) { build(:clusters_applications_helm) }
    subject { described_class.new(application).as_json }

    it 'has name' 


    it 'has status' 


    it 'has no status_reason' 


    context 'when application is errored' do
      let(:application) { build(:clusters_applications_helm, :errored) }

      it 'has corresponded data' 

    end

    context 'for ingress application' do
      let(:application) do
        build(
          :clusters_applications_ingress,
          :installed,
          external_ip: '111.222.111.222'
        )
      end

      it 'includes external_ip' 

    end
  end
end

