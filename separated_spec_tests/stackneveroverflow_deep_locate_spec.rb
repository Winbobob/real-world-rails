require 'spec_helper'
require 'active_support/core_ext/hash/indifferent_access'

describe Hashie::Extensions::DeepLocate do
  let(:hash) do
    {
      from: 0,
      size: 25,
      query: {
        bool: {
          must: [
            {
              query_string: {
                query: 'foobar',
                default_operator: 'AND',
                fields: [
                  'title^2',
                  '_all'
                ]
              }
            },
            {
              match: {
                field_1: 'value_1'
              }
            },
            {
              range: {
                lsr09: {
                  gte: 2014
                }
              }
            }
          ],
          should: [
            {
              match: {
                field_2: 'value_2'
              }
            }
          ],
          must_not: [
            {
              range: {
                lsr10: {
                  gte: 2014
                }
              }
            }
          ]
        }
      }
    }
  end

  describe '.deep_locate' do
    context 'if called with a non-callable comparator' do
      it 'creates a key comparator on-th-fly' 

    end

    it 'locates enumerables for which the given comparator returns true for at least one element' 


    it 'returns an empty array if nothing was found' 

  end

  context 'if extending an existing object' do
    let(:extended_hash) do
      hash.extend(described_class)
    end

    it 'adds #deep_locate' 

  end

  context 'if included in a hash' do
    let(:derived_hash_with_extension_included) do
      Class.new(Hash) do
        include Hashie::Extensions::DeepLocate
      end
    end

    let(:instance) do
      derived_hash_with_extension_included.new.update(hash)
    end

    it 'adds #deep_locate' 

  end

  context 'on an ActiveSupport::HashWithIndifferentAccess' do
    let(:instance) { hash.dup.with_indifferent_access }

    it 'can locate symbolic keys' 


    it 'can locate string keys' 

  end
end

