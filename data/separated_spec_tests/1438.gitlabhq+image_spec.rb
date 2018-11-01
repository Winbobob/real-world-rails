require 'spec_helper'

describe Gitlab::Ci::Build::Image do
  let(:job) { create(:ci_build, :no_options) }

  describe '#from_image' do
    subject { described_class.from_image(job) }

    context 'when image is defined in job' do
      let(:image_name) { 'ruby:2.1' }
      let(:job) { create(:ci_build, options: { image: image_name } ) }

      context 'when image is defined as string' do
        it 'fabricates an object of the proper class' 


        it 'populates fabricated object with the proper name attribute' 

      end

      context 'when image is defined as hash' do
        let(:entrypoint) { '/bin/sh' }
        let(:job) { create(:ci_build, options: { image: { name: image_name, entrypoint: entrypoint } } ) }

        it 'fabricates an object of the proper class' 


        it 'populates fabricated object with the proper attributes' 

      end

      context 'when image name is empty' do
        let(:image_name) { '' }

        it 'does not fabricate an object' 

      end
    end

    context 'when image is not defined in job' do
      it 'does not fabricate an object' 

    end
  end

  describe '#from_services' do
    subject { described_class.from_services(job) }

    context 'when services are defined in job' do
      let(:service_image_name) { 'postgres' }
      let(:job) { create(:ci_build, options: { services: [service_image_name] }) }

      context 'when service is defined as string' do
        it 'fabricates an non-empty array of objects' 


        it 'populates fabricated objects with the proper name attributes' 

      end

      context 'when service is defined as hash' do
        let(:service_entrypoint) { '/bin/sh' }
        let(:service_alias) { 'db' }
        let(:service_command) { 'sleep 30' }
        let(:job) do
          create(:ci_build, options: { services: [{ name: service_image_name, entrypoint: service_entrypoint,
                                                    alias: service_alias, command: service_command }] })
        end

        it 'fabricates an non-empty array of objects' 


        it 'populates fabricated objects with the proper attributes' 

      end

      context 'when service image name is empty' do
        let(:service_image_name) { '' }

        it 'fabricates an empty array' 

      end
    end

    context 'when services are not defined in job' do
      it 'fabricates an empty array' 

    end
  end
end

