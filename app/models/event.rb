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

  def set_default_times
    start_time = Time.current.adjust_to_nearest_half_hour

    self.start_time ||= start_time

    # TODO extract 30 minutes as a parameter for the user
    self.end_time ||= start_time + 30.minutes
  end

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
