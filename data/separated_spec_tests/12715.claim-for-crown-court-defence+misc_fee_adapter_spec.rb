require 'rails_helper'

RSpec.describe CCR::Fee::MiscFeeAdapter, type: :adapter do
  subject { described_class.new.call(fee) }

  let(:fee) { instance_double('fee') }
  let(:fee_type) { instance_double('fee_type', unique_code: 'MIAPH', description: 'Abuse of process hearings (half day)') }

  before do
    allow(fee).to receive(:fee_type).and_return fee_type
  end

  it_behaves_like 'a mapping fee adapter'

  EXCLUSIONS = %i[BACAV].freeze

  MAPPINGS = {
    BACAV: %w[AGFS_MISC_FEES AGFS_CONFERENCE], # Conferences and views (basic fee)
    BAPCM: %w[AGFS_MISC_FEES AGFS_PLEA], # Plea & Case management hearing
    BASAF: %w[AGFS_MISC_FEES AGFS_STD_APPRNC], # Standard appearance fee (basic fee) - *** CCR/Regulations apply same fee to any SAF***
    FXSAF: %w[AGFS_MISC_FEES AGFS_STD_APPRNC], # Standard Appearance fee (fixed fee) - *** CCR/Regulations apply same fee to any SAF***
    FXCON: %w[AGFS_MISC_FEES AGFS_CONTEMPT], # Contempt (fixed fee)
    MIAPH: %w[AGFS_MISC_FEES AGFS_ABS_PRC_HF], # Abuse of process hearings (half day)
    MIAPW: %w[AGFS_MISC_FEES AGFS_ABS_PRC_WL], # Abuse of process hearings (whole day)
    FXADJ: %w[AGFS_MISC_FEES AGFS_ADJOURNED], # Adjourned appeals, committals and breaches
    MIADC1: %w[AGFS_MISC_FEES AGFS_DMS_DY2_HF], # Application to dismiss a charge (half day)
    MIADC2: %w[AGFS_MISC_FEES AGFS_DMS_DY2_WL], # Application to dismiss a charge (whole day)
    MIDTH: %w[AGFS_MISC_FEES AGFS_CONFISC_HF], # Confiscation hearings (half day)
    MIDTW: %w[AGFS_MISC_FEES AGFS_CONFISC_WL], # Confiscation hearings (whole day)
    MIDSE: %w[AGFS_MISC_FEES AGFS_DEF_SEN_HR], # Deferred sentence hearings
    MIFCM: %w[AGFS_MISC_FEES AGFS_FCMH], # Further case management hearing
    MIGRH: %w[AGFS_MISC_FEES AGFS_GRH_HALF], # Ground rules hearing (half day)
    MIGRW: %w[AGFS_MISC_FEES AGFS_GRH_FULL], # Ground rules hearing (whole day)
    MIAEH: %w[AGFS_MISC_FEES AGFS_ADM_EVD_HF], # Hearings relating to admissibility of evidence (half day)
    MIAEW: %w[AGFS_MISC_FEES AGFS_ADM_EVD_WL], # Hearings relating to admissibility of evidence (whole day)
    MIHDH: %w[AGFS_MISC_FEES AGFS_DISC_HALF], # Hearings relating to disclosure (half day)
    MIHDW: %w[AGFS_MISC_FEES AGFS_DISC_FULL], # Hearings relating to disclosure (whole day)
    MINBR: %w[AGFS_MISC_FEES AGFS_NOTING_BRF], # Noting brief fee
    MIPPC: %w[AGFS_MISC_FEES AGFS_PAPER_PLEA], # Paper plea & case management
    MIPCH: %w[AGFS_MISC_FEES AGFS_CONFISC_HF], # Proceeds of crime hearings (half day) **** DUPLICATE - sames as confiscation hearings above****
    MIPCW: %w[AGFS_MISC_FEES AGFS_CONFISC_WL], # Proceeds of crime hearings (whole day) **** DUPLICATE - sames as confiscation hearings above****
    MIPIH1: %w[AGFS_MISC_FEES AGFS_PI_IMMN_HF], # Public interest immunity hearings (half day)
    MIPIH2: %w[AGFS_MISC_FEES AGFS_PI_IMMN_WL], # Public interest immunity hearings (whole day)
    MIRNF: %w[AGFS_MISC_FEES AGFS_NOVELISSUE], # Research of very unusual or novel factual issue
    MIRNL: %w[AGFS_MISC_FEES AGFS_NOVEL_LAW], # Research of very unusual or novel point of law
    MISHR: %w[AGFS_MISC_FEES AGFS_SENTENCE], # Sentence hearings
    MISPF: %w[AGFS_MISC_FEES AGFS_SPCL_PREP], # Special preparation fee - AGFS only version
    MITNP: %w[AGFS_MISC_FEES AGFS_NOT_PRCD], # Trial not proceed
    MIUAV1: %w[AGFS_MISC_FEES AGFS_UN_VAC_HF], # Unsuccessful application to vacate a guilty plea (half day)
    MIUAV2: %w[AGFS_MISC_FEES AGFS_UN_VAC_WL], # Unsuccessful application to vacate a guilty plea (whole day)
    MIWPF: %w[AGFS_MISC_FEES AGFS_WSTD_PREP], # Wasted preparation fee
    MIWOA: %w[AGFS_MISC_FEES AGFS_WRTN_ORAL], # Written / oral advice
  }.except(*EXCLUSIONS).freeze

  describe '#bill_type' do
    subject { described_class.new.call(fee).bill_type }

    it 'returns CCR Miscellaneous Fee bill type' 


    context 'mappings' do
      MAPPINGS.each do |code, bill_types|
        bill_type = bill_types[0]
        context "maps #{code} to #{bill_type || 'nil'}" do
          before do
            allow(fee_type).to receive(:unique_code).and_return code
          end

          it "returns #{bill_type || 'nil'}" 

        end
      end
    end
  end

  describe '#bill_subtype' do
    subject { described_class.new.call(fee).bill_subtype }

    context 'mappings' do
      MAPPINGS.each do |code, bill_types|
        bill_subtype = bill_types[1]
        context "maps #{code} to #{bill_subtype || 'nil'}" do
          before do
            allow(fee_type).to receive(:unique_code).and_return code
          end

          it "returns #{bill_subtype || 'nil'}" 

        end
      end
    end
  end

  describe '#claimed?' do
    subject { described_class.new.call(fee).claimed? }

    it 'returns true when the misc fee is being claimed' 


    it 'returns true when the misc fee has a positive quantity rate or amount' 


    it 'returns false when the misc has zero values for quantity, rate and amount' 


    it 'returns false when the misc has nil values for quantity, rate and amount'do
      allow(fee).to receive_messages(quantity: nil, rate: nil, amount: nil)
      is_expected.to be false
    end

    it 'returns false when the fee is of an explicitly excluded type' 

  end
end

