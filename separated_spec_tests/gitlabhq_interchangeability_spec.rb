require 'spec_helper'

feature 'Interchangeability between KubernetesService and Platform::Kubernetes' do
  EXCEPT_METHODS = %i[test title description help fields initialize_properties namespace namespace= api_url api_url= deprecated? deprecation_message].freeze
  EXCEPT_METHODS_GREP_V = %w[_touched? _changed? _was].freeze

  it 'Clusters::Platform::Kubernetes covers core interfaces in KubernetesService' 

end

