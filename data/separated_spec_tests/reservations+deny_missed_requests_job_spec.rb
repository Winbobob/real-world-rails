# frozen_string_literal: true
require 'spec_helper'

describe DenyMissedRequestsJob, type: :job do
  it_behaves_like 'email job', {}, :missed_requests
  it 'flags missed requests as denied and expired' 

end

