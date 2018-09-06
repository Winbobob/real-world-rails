# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe HealthChecks do
  include HealthChecks

  describe '#add' do

    it 'adds a check to the collection and returns the check' 


    it 'does not add checks that do not define the check method' 


  end

  describe '#all' do

    it 'returns all the checks' 


  end

  describe '#each' do

    it 'iterates over each check' 


  end

  describe '#ok?' do

    it 'returns true if all checks are ok' 


    it 'returns false if all checks fail' 


    it 'returns false if a single check fails' 


  end

end

