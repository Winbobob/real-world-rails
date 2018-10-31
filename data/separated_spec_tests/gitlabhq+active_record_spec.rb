require 'spec_helper'

describe Gitlab::Metrics::Subscribers::ActiveRecord do
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }
  let(:subscriber)  { described_class.new }

  let(:event) do
    double(:event, duration: 2,
                   payload:  { sql: 'SELECT * FROM users WHERE id = 10' })
  end

  describe '#sql' do
    describe 'without a current transaction' do
      it 'simply returns' 

    end

    describe 'with a current transaction' do
      it 'observes sql_duration metric' 


      it 'increments the :sql_duration value' 


      context 'events are internal to Rails or irrelevant' do
        let(:schema_event) do
          double(
            :event,
            name: 'sql.active_record',
            payload: {
              sql: "SELECT attr.attname FROM pg_attribute attr INNER JOIN pg_constraint cons ON attr.attrelid = cons.conrelid AND attr.attnum = any(cons.conkey) WHERE cons.contype = 'p' AND cons.conrelid = '\"projects\"'::regclass",
              name: 'SCHEMA',
              connection_id: 135,
              statement_name: nil,
              binds: []
            },
            duration: 0.7
          )
        end

        let(:begin_event) do
          double(
            :event,
            name: 'sql.active_record',
            payload: {
              sql: "BEGIN",
              name: nil,
              connection_id: 231,
              statement_name: nil,
              binds: []
            },
            duration: 1.1
          )
        end

        let(:commit_event) do
          double(
            :event,
            name: 'sql.active_record',
            payload: {
              sql: "COMMIT",
              name: nil,
              connection_id: 212,
              statement_name: nil,
              binds: []
            },
            duration: 1.6
          )
        end

        it 'skips schema/begin/commit sql commands' 

      end
    end
  end
end

