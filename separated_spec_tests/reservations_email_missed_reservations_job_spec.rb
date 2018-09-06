# frozen_string_literal: true
require 'spec_helper'

describe EmailMissedReservationsJob, type: :job do
  it_behaves_like 'email job',
                  { send_notifications_for_deleted_missed_reservations: true },
                  :missed_not_emailed
  it 'sets the missed_email_sent flag' 

end

