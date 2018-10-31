RSpec.describe ActiveJobTenant do
  before do
    allow(Apartment::Tenant).to receive(:current).and_return('x')
    allow(Account).to receive(:find_by).with(tenant: 'x').and_return(account)
    allow(Apartment::Tenant).to receive(:switch).with('x') do |&block|
      block.call
    end
  end

  let(:account) { FactoryGirl.build(:account) }

  subject do
    Class.new(ActiveJob::Base) do
      def perform
        current_account
      end
    end
  end

  describe 'tenant context' do
    it 'evaluates in the context of a tenant and account' 

  end

  # mimics the `.perform_later` workflow
  describe '.deserialize' do
    let(:serialized_job) { subject.new.serialize.merge('job_class' => 'ActiveJob::Base') }
    let(:delayed_subject) { subject.deserialize(serialized_job) }

    it 'preserves the original tenant' 

  end

  describe '#perform_now' do
    context 'a non-tenant-job' do
      subject do
        Class.new(ActiveJob::Base) do
          non_tenant_job

          def perform; end
        end
      end

      it 'runs the job in the public, non-tenant scope' 

    end

    context 'a normal job' do
      it 'runs the job in the context of a tenant' 

    end
  end
end

