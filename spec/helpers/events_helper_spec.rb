require 'rails_helper'

RSpec.configure do |config|
  config.include ActiveSupport::Testing::TimeHelpers
end

RSpec.describe EventsHelper, type: :helper do
  let(:two_days_ago) { 2.days.ago }
  let(:yesterday) { 1.day.ago }
  let(:tomorrow) { 1.day.from_now }
  let(:event) { create(:event, start_date: two_days_ago, end_date: tomorrow) }
  let(:second_event) { create(:event, start_date: two_days_ago, end_date: yesterday) }


  describe '#event_status' do
    context 'when event is active' do
      it { expect(helper.event_status(event)).to eq 'Active' }
    end

    context 'when event is inactive' do
      it { expect(helper.event_status(second_event)).to eq 'Inactive' }
    end
  end
end
