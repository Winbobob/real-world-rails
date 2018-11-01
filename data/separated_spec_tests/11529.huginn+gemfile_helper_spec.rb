require 'rails_helper'

describe GemfileHelper do
  context 'parse_each_agent_gem' do
    VALID_STRINGS = [
      ['huginn_nlp_agents(~> 0.2.1)', [
        ['huginn_nlp_agents', '~> 0.2.1']
      ]],
      ['huginn_nlp_agents(~> 0.2.1, git: http://github.com/dsander/huginn.git, branch: agents_in_gems)',
        [['huginn_nlp_agents', '~> 0.2.1', git: 'http://github.com/dsander/huginn.git', branch: 'agents_in_gems']]
      ],
      ['huginn_nlp_agents(~> 0.2.1, git: http://github.com/dsander/huginn.git, ref: 2342asdab)  , huginn_nlp_agents(~> 0.2.1)', [
        ['huginn_nlp_agents', '~> 0.2.1', git: 'http://github.com/dsander/huginn.git', ref: '2342asdab'],
        ['huginn_nlp_agents', '~> 0.2.1']
      ]],
      ['huginn_nlp_agents(~> 0.2.1, path: /tmp/test)', [
        ['huginn_nlp_agents', '~> 0.2.1', path: '/tmp/test']
      ]],
      ['huginn_nlp_agents', [
        ['huginn_nlp_agents']
      ]],
      ['huginn_nlp_agents, test(0.1), test2(github: test2/huginn_test)', [
        ['huginn_nlp_agents'],
        ['test', '0.1'],
        ['test2', github: 'test2/huginn_test']
      ]],
      ['huginn_nlp_agents(git: http://github.com/dsander/huginn.git, ref: 2342asdab)', [
        ['huginn_nlp_agents', git: 'http://github.com/dsander/huginn.git', ref: '2342asdab']
      ]],
    ]

    it 'parses valid gem strings correctly' 


    it 'does nothing when nil is passed' 


    it 'does nothing when an empty string is passed' 

  end
end

