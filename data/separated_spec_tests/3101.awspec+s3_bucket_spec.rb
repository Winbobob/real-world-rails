require 'spec_helper'

describe Awspec::Generator::Spec::S3Bucket do
  before do
    Awspec::Stub.load 's3_bucket'
  end
  let(:s3_bucket) { Awspec::Generator::Spec::S3Bucket.new }
  it 'generates spec' 

  it do
    should have_lifecycle_rule(
      id: 'MyRuleName2',
      filter: { prefix: '123/' },
      noncurrent_version_expiration: { noncurrent_days: 2 },
      expiration: { days: 3 },
      transitions: [{ days: 5, storage_class: 'STANDARD_IA' }, { days: 10, storage_class: 'GLACIER' }],
      status: 'Enabled'
    )
  end
end
EOF
    expect(s3_bucket.generate_all.to_s).to eq spec
    expect(s3_bucket.generate('my-bucket').to_s).to eq spec
  end
end

