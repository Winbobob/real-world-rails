describe AirbrakeApi::V3::NoticeParser do
  let(:app) { Fabricate(:app) }
  let(:notifier_params) do
    {
      'name'    => 'notifiername',
      'version' => 'notifierversion',
      'url'     => 'notifierurl'
    }
  end

  it 'raises error when errors attribute is missing' 


  it 'does not raise an error for the optional environment field' 


  it 'parses JSON payload and returns ErrorReport' 


  it 'parses JSON payload when api_key is missing but project_id is present' 


  it 'parses JSON payload with missing backtrace' 


  it 'parses JSON payload with deprecated user keys' 


  it 'takes the notifier from root' 


  it 'takes the notifier from the context' 


  it 'takes the hostname from the context' 


  def build_params_for(fixture, options = {})
    json = Rails.root.join('spec', 'fixtures', fixture).read
    data = JSON.parse(json)

    data['key'] = options[:key] if options.key?(:key)
    data['project_id'] = options[:project_id] if options.key?(:project_id)

    data
  end
end

