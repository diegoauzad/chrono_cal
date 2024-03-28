require "test_helper"

class EventTest < ActiveSupport::TestCase
  test 'valid with valid attributes' do
    event = Event.new(title: 'Sample Event', start_time: 2.days.from_now, end_time: 3.days.from_now)
    assert event.valid?
  end

  test 'not valid if end_time is before start_time' do
    event = Event.new(title: 'Sample Event', start_time: 3.days.from_now, end_time: 1.days.from_now)
    refute event.valid?
  end

  test 'correctly handles events created in different time zones' do
    Time.use_zone('La Paz') do
      event = Event.create(title: 'Event in La Paz',
                           start_time: Time.zone.parse('2024-04-01 10:00'),
                           end_time: Time.zone.parse('2024-04-01 11:00'))
      assert_equal 14, event.start_time.utc.hour
      assert_equal 15, event.end_time.utc.hour
    end
  end

end
