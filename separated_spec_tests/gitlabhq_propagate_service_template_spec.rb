require 'spec_helper'

describe Projects::PropagateServiceTemplate do
  describe '.propagate' do
    let!(:service_template) do
      PushoverService.create(
        template: true,
        active: true,
        properties: {
          device: 'MyDevice',
          sound: 'mic',
          priority: 4,
          user_key: 'asdf',
          api_key: '123456789'
        })
    end

    let!(:project) { create(:project) }

    it 'creates services for projects' 


    it 'creates services for a project that has another service' 


    it 'does not create the service if it exists already' 


    it 'creates the service containing the template attributes' 


    describe 'bulk update' do
      let(:project_total) { 5 }

      before do
        stub_const 'Projects::PropagateServiceTemplate::BATCH_SIZE', 3

        project_total.times { create(:project) }

        described_class.propagate(service_template)
      end

      it 'creates services for all projects' 

    end

    describe 'external tracker' do
      it 'updates the project external tracker' 

    end

    describe 'external wiki' do
      it 'updates the project external tracker' 

    end
  end
end

