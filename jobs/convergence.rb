# Bookings trend graph for mock Turo dashboard
points = []
(1..10).each do |i|
  points << { x: i, y: 160 + rand(-25..25) }
end
last_x = points.last[:x]

SCHEDULER.every '5s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: 160 + rand(-35..35) }

  send_event('bookings_trend', points: points)
end