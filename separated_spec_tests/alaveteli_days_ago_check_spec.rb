# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe HealthChecks::Checks::DaysAgoCheck do
  include HealthChecks::Checks

  it { is_expected.to be_kind_of(HealthChecks::HealthCheckable) }

  it 'defaults to comparing to one day ago' 


  it 'accepts a custom number of days' 


  describe :ok? do

    it 'is successful if the subject is in the last day' 


    it 'fails if the subject is over a day ago' 


  end

  describe :failure_message do

    it 'includes the check subject in the default message' 


    it 'includes the check subject in a custom message' 


  end

  describe :success_message do

    it 'includes the check subject in the default message' 


    it 'includes the check subject in a custom message' 


  end

end

