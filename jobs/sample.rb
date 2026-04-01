current_trips = 175430
current_gbv = 48200000

SCHEDULER.every '5s' do
  last_trips = current_trips
  last_gbv   = current_gbv

  current_trips = current_trips + rand(-120..220)
  current_gbv   = current_gbv + rand(-90000..170000)

  utilization = 58 + rand(-3.0..3.0).round(1)
  cancellation = (4.1 + rand(-0.6..0.6)).round(2)

  send_event('trips_today', { current: current_trips, last: last_trips })
  send_event('utilization', { value: utilization })
  send_event('cancellation', { value: cancellation })

  send_event('turo_overview', {
    title: 'Turo Ops Snapshot',
    text: "GBV MTD: $#{(current_gbv / 1_000_000.0).round(1)}M · Active Hosts: #{68000 + rand(-180..220)}",
    moreinfo: "Take Rate: #{(23.5 + rand(-0.4..0.4)).round(1)}% · NPS: #{63 + rand(-2..2)}"
  })

  send_event('city_hotspots', {
    items: [
      { label: 'Los Angeles', value: "#{17800 + rand(-500..500)}" },
      { label: 'San Diego', value: "#{8400 + rand(-300..300)}" },
      { label: 'San Francisco', value: "#{7700 + rand(-250..250)}" },
      { label: 'Phoenix', value: "#{6200 + rand(-220..220)}" },
      { label: 'Seattle', value: "#{5900 + rand(-180..180)}" }
    ]
  })

  send_event('ops_alerts', {
    items: [
      { label: 'Claims Queue', value: "#{140 + rand(-10..12)} open" },
      { label: 'Support FRT', value: "#{(2.4 + rand(-0.4..0.5)).round(1)} min" },
      { label: 'Fraud Blocks', value: "#{(0.7 + rand(-0.2..0.2)).round(2)}%" },
      { label: 'Host Activation', value: "#{(44.5 + rand(-1.5..1.5)).round(1)}%" }
    ]
  })
end