class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy

  VALID_FEE_STATUS = %w[Free Paid].freeze

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :fee_status, presence: true
  validates :fee_status, inclusion: { in: VALID_FEE_STATUS }
  validate :end_date_must_be_later_than_start_date

  # Ensure start date is always earlier than end_date
  def end_date_must_be_later_than_start_date
    return unless start_date && end_date

    condition = self.start_date.after? self.end_date
    errors.add(:end_date, 'must be later than start_date') if condition
  end
end
