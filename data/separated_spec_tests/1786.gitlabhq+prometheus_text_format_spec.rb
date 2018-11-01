describe Gitlab::HealthChecks::PrometheusTextFormat do
  let(:metric_class) { Gitlab::HealthChecks::Metric }
  subject { described_class.new }

  describe '#marshal' do
    let(:sample_metrics) do
      [metric_class.new('metric1', 1),
       metric_class.new('metric2', 2)]
    end

    it 'marshal to text with non repeating type definition' 


    context 'metrics where name repeats' do
      let(:sample_metrics) do
        [metric_class.new('metric1', 1),
         metric_class.new('metric1', 2),
         metric_class.new('metric2', 3)]
      end

      it 'marshal to text with non repeating type definition' 

    end
  end
end

