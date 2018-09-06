# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliMailPoller do
  let(:mockpop3) { MockPOP3.new }
  let(:poller) { AlaveteliMailPoller.new(pop3: mockpop3) }

  describe '.poll_for_incoming_loop' do

    context 'if the mail retrieval config is not set to poll a POP server' do
      before do
        allow(AlaveteliConfiguration).
        to receive(:production_mailer_retriever_method).and_return("passive")
      end

      it 'does not create a poller' 


    end

  end

  describe '#poll_for_incoming' do

    it 'starts and ends a session with the POP server' 


    context 'if there is no mail on the POP server' do
      let(:mockpop3) { MockPOP3.new(0) }

      it 'returns false' 


    end

    context 'if there is mail on the POP server' do
      let(:mockpop3) { MockPOP3.new(1) }

      it 'returns true' 


      it 'sends the mail to RequestMailer.receive' 


      it 'deletes the mail' 


      context 'if there is an error getting the unique ID of a mail' do

        before do
          allow(mockpop3.mails.first).
            to receive(:unique_id).
              and_raise(Net::POPError.new("Error code"))
        end

        it 'sends an exception notification' 


      end

      context 'if there is an error getting the text of a mail' do

        before do
          allow(mockpop3.mails.first).
            to receive(:pop).
              and_raise(Net::POPError.new("Error code"))
        end

        it 'sends an exception notification' 


        context 'if there is already an error for this mail' do

          before do
            IncomingMessageError.
              create(unique_id: mockpop3.mails.first.unique_id,
                     retry_at: Time.zone.now)
          end
          it <<-EOF do
            updates the error for the unique ID with a time of
            30 minutes from now
          EOF
            poller.poll_for_incoming
            errors = IncomingMessageError.
                       where(unique_id: mockpop3.mails.first.unique_id)
            expect(errors.size).to eq(1)
            incoming_message_error = errors.first
            expect(incoming_message_error.retry_at).
              to be_within(5.seconds).of(Time.zone.now + 30.minutes)
          end

        end

        context 'if there is no error for this mail' do

          it 'stores the error for the unique ID with a time of 30
              minutes from now' do
            poller.poll_for_incoming
            errors = IncomingMessageError.
                       where(unique_id: mockpop3.mails.first.unique_id)
            expect(errors.size).to eq(1)
            incoming_message_error = errors.first
            expect(incoming_message_error.retry_at).
              to be_within(5.seconds).of(Time.zone.now + 30.minutes)
          end

        end

      end

      context 'if there is an error receiving the mail' do

        before do
          allow(RequestMailer).to receive(:receive).
            with(mockpop3.mails.first.pop, :poller).
              and_raise(ActiveRecord::StatementInvalid.new("Deadlock"))
        end

        it 'stores the unique ID with a retry time of 30 minutes from now' 


        it 'sends an exception notification' 


        it 'returns false' 


      end

      context 'if there is an error deleting the mail' do

        before do
          allow(mockpop3.mails.first).
            to receive(:delete).
              and_raise(Net::POPError.new("Error code"))
        end

        it 'stores the unique ID with no retry time' 


        it 'passes the mail to the RequestMailer' 


        it 'sends an exception notification' 


        it 'returns true' 


      end

      context 'if mail has previously failed' do

        context 'and the mail has no retry time' do

          before do
            IncomingMessageError.create!(
              unique_id: mockpop3.mails.first.unique_id
            )
          end

          it 'does not send it to RequestMailer.receive' 


          it 'returns false' 


        end

        context 'and the mail has not reached its retry time' do

          before do
            IncomingMessageError.create!(
              unique_id: mockpop3.mails.first.unique_id,
              retry_at: Time.now + 30.minutes
            )
          end

          it 'does not send it to RequestMailer.receive' 


          it 'returns false' 


        end

        context 'and the mail has reached its retry time' do

          before do
            IncomingMessageError.create!(
              unique_id: mockpop3.mails.first.unique_id,
              retry_at: Time.now - 30.minutes
            )
          end

          it 'sends it to RequestMailer.receive' 


          it 'returns true' 


        end
      end
    end

    context 'if there is a timeout connecting to the POP server' do

      before do
        allow(mockpop3).to receive(:start).
          and_raise(Timeout::Error, 'execution expired')
      end

      it 'sends an exception notification' 


    end

  end
end

