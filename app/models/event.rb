class Event < ApplicationRecord

  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :title, presence: true

  validate :end_time_after_start_time

  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  private

  def end_time_after_start_time

    return if end_time.blank? || start_time.blank?

    # TODO extract to strings file
    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end

  end

  # 🚅 add methods above.

end
