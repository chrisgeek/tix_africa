require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:fee_status) }
  end

  describe '#end_date_must_be_later_than_start_date' do
    let(:event) { build(:event, start_date: 2.days.from_now, end_date: 1.day.ago) }

    it { expect(event).not_to be_valid }
  end
end
