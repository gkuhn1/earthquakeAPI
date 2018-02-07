# README

This application exposes a JSON API to query data about earthquakes that affected LA.

- The data is loaded from [here](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv)
every 30 seconds through a background scheduled job.
- Events that were already loaded are *not* updated. Only new events are added.

## Installation

##### With docker & docker-compose:
1. `docker-compose build`
1. `docker-compose start redis db`
1. `docker-compose up web_server`

##### Local environment:
1. Setup redis
1. Setup postgres
1. Install Ruby 2.5
1. Install Bundle
1. Run `bin/setup`

- Application should be available in **http://localhost:3000** for both environments

## Running specs

1. `bin/rspec`

```
............

Finished in 0.27069 seconds (files took 3.87 seconds to load)
12 examples, 0 failures

```

## API Examples

### GET /earthquakes

##### Params
- start_at: ISO8601 date time format (default: 30 days ago)
- end_at: ISO8601 date time format (default: now())

##### Request Example
- Retrieve Earthquake events based on a **start_at** and **end_at** dates:
```
curl -X GET \
  'http://localhost:3000/earthquakes?start_at=2018-01-16T07:58:58+00:00&end_at=2018-01-17T07:58:58+00:00'
  ```

##### Response Format
```
{
  "data": [
    {
      "id": 3727,
      "event_id": "ci38088664",
      "time": "2018-01-17T07:35:47.500Z",
      "latitude": "34.023",
      "longitude": "-116.7421667",
      "event_type": "earthquake",
      "distance_from_la": "85.9342143745399",
      "mag": "1.15",
      "place": "12km NNE of Cabazon, CA",
      "created_at": "2018-01-31T07:44:15.164Z",
      "updated_at": "2018-01-31T07:44:15.164Z"
    }
}
```