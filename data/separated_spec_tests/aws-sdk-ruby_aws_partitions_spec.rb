require_relative 'spec_helper'

module Aws
  describe Partitions do

    let(:partitions) { Partitions.partitions }

    describe '.partition' do

      %w(aws aws-cn aws-us-gov).each do |p|
        it "can return a partition by name: #{p.inspect}" 

      end

      it 'raises ArgumentError on unknown partition names' 


    end

    describe '.partitions' do

      it 'returns a list of Partition objects' 


    end

    describe Partitions::Partition do

      describe '#name' do

        it 'returns the partition name' 


      end

      describe '#region' do

        it 'gets a region by name' 


        it 'returns a list of supported services with the region' 


        it 'raises ArgumentError for unknown regions' 


        it 'provides a list of valid region names in the argument error' 


      end

      describe '#regions' do

        it 'returns an array of Region objects' 


        it 'includes regions from the current partition' 


        it 'does not include the partition global endpoint name' 


      end

      describe '#service' do

        it 'can return a service by name' 


        it 'raises ArgumentError for unknown regions' 


        it 'provides a list of valid region names in the argument error' 

      end

      describe '#services' do

        it 'returns a list of supported services' 


      end

    end

    describe Partitions::Region do

      it '#name returns the region name' 


      it '#description returns the region name' 


      it '#partition_name returns the partition name' 


      it '#services returns the list of services available in region' 


    end

    describe Partitions::Service do

      it '#name returns the service name' 


      it '#partition_name returns the parition name' 


      it '#regions returns partition regions for the service' 


      it '#partition_region returns the partition global endpoint region' 


      it '#regionalized? returns true if the service is regionalized' 


      it '#regions returns the list of regions the service is available in' 


    end

    describe 'symmetry' do
      Partitions::PartitionList.new.each do |partition|

        partition.services.each do |service|
          service.regions.each do |region|
            it "#{partition.name} : service #{service.name} : region #{region}" 

          end
        end

        partition.regions.each do |region|
          region.services.each do |service|

            it "#{partition.name} : region #{region.name} : service #{service}" 


          end
        end

      end
    end
  end
end

