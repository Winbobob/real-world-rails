require "spec_helper"
require "fog/bin"
require "helpers/bin"

describe AWS do
  include Fog::BinSpec

  let(:subject) { AWS }

  KEY_CLASS_MAPPING = {
    :auto_scaling => Fog::AWS::AutoScaling,
    :beanstalk => Fog::AWS::ElasticBeanstalk,
    :cdn => Fog::CDN::AWS,
    :cloud_formation => Fog::AWS::CloudFormation,
    :cloud_watch => Fog::AWS::CloudWatch,
    :compute => Fog::Compute::AWS,
    :data_pipeline => Fog::AWS::DataPipeline,
    :ddb => Fog::AWS::DynamoDB,
    :dynamodb => Fog::AWS::DynamoDB,
    :dns => Fog::DNS::AWS,
    :elasticache => Fog::AWS::Elasticache,
    :elb => Fog::AWS::ELB,
    :emr => Fog::AWS::EMR,
    :glacier => Fog::AWS::Glacier,
    :iam => Fog::AWS::IAM,
    :redshift => Fog::AWS::Redshift,
    :sdb => Fog::AWS::SimpleDB,
    :simpledb => Fog::AWS::SimpleDB,
    :ses => Fog::AWS::SES,
    :sqs => Fog::AWS::SQS,
    :eu_storage => Fog::Storage::AWS,
    :storage => Fog::Storage::AWS,
    :rds => Fog::AWS::RDS,
    :sns => Fog::AWS::SNS,
    :sts => Fog::AWS::STS
  }

  describe "#services" do
    it "includes all services" 

  end

  describe "#class_for" do
    describe "when key exists" do
      it "maps to correct class" 

    end

    describe "when key does not exist" do
      it "raises ArgumentError" 

    end
  end

  describe "#[]" do
    describe "when service is recognised" do
      it "returns correct instance" 

    end

    describe "when service is not recognised" do
      it "raises ArgumentError" 

    end
  end
end

