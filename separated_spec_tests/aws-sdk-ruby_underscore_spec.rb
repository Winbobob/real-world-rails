require_relative '../spec_helper'

module AwsSdkCodeGenerator
  module Underscore
    describe 'underscore' do

      it 'downcases titleized words' 


      it 'breaks compound titleized words with underscores' 


      it 'treats acronyms as a single word' 


      it 'preserves leading acronyms' 


      it 'preserves trailing acronyms' 


      it 'preserves nested acronyms' 


      it 'treats trailing numbers as a part of acronyms' 


      it 'does not include leading numbers as part of a word' 


      it 'accepts words that start with a lower case letter' 


      describe 'irregular inflections' do
        {
          'ETag' => 'etag',
          's3Bucket' => 's3_bucket',
          's3Key' => 's3_key',
          'Ec2KeyName' => 'ec2_key_name',
          'Ec2SubnetId' => 'ec2_subnet_id',
          'Ec2VolumeId' => 'ec2_volume_id',
          'Ec2InstanceId' => 'ec2_instance_id',
          'ElastiCache' => 'elasticache',
          'NotificationARNs' => 'notification_arns',
          'SentLast24Hours' => 'sent_last_24_hours',
          'Max24HourSend' => 'max_24_hour_send',
          'AuthenticationCode1' => 'authentication_code_1',
          'AuthenticationCode2' => 'authentication_code_2',
          'SwapEnvironmentCNAMEs' => 'swap_environment_cnames',
          'CachediSCSIVolume' => 'cached_iscsi_volume',
          'CachediSCSIVolumeInformation' => 'cached_iscsi_volume_information',
          'CachediSCSIVolumes' => 'cached_iscsi_volumes',
          'CreateCachediSCSIVolume' => 'create_cached_iscsi_volume',
          'CreateCachediSCSIVolumeInput' => 'create_cached_iscsi_volume_input',
          'CreateCachediSCSIVolumeOutput' => 'create_cached_iscsi_volume_output',
          'CreateStorediSCSIVolume' => 'create_stored_iscsi_volume',
          'CreateStorediSCSIVolumeInput' => 'create_stored_iscsi_volume_input',
          'CreateStorediSCSIVolumeOutput' => 'create_stored_iscsi_volume_output',
          'DescribeCachediSCSIVolumes' => 'describe_cached_iscsi_volumes',
          'DescribeCachediSCSIVolumesInput' => 'describe_cached_iscsi_volumes_input',
          'DescribeCachediSCSIVolumesOutput' => 'describe_cached_iscsi_volumes_output',
          'DescribeStorediSCSIVolumes' => 'describe_stored_iscsi_volumes',
          'DescribeStorediSCSIVolumesInput' => 'describe_stored_iscsi_volumes_input',
          'DescribeStorediSCSIVolumesOutput' => 'describe_stored_iscsi_volumes_output',
          'DeviceiSCSIAttributes' => 'device_iscsi_attributes',
          'StorediSCSIVolume' => 'stored_iscsi_volume',
          'StorediSCSIVolumeInformation' => 'stored_iscsi_volume_information',
          'StorediSCSIVolumes' => 'stored_iscsi_volumes',
          'VolumeiSCSIAttributes' => 'volume_iscsi_attributes'
        }.each do |camel_case, underscored|
          it "inflects #{camel_case} to #{underscored}" 

        end

      end
    end
  end
end

