# README

This application expose a JSON API to query data about earthquakes that affected LA.

The data is loaded from [here](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv)
every 30 seconds through a background scheduled job.

## Installation

##### With docker & docker-compose:
1. `docker-compose build`
1. `docker-compose up`

##### Local environment:
1. Setup redis
2. Setup postgres
3. Install Ruby 2.5
4. Install Bundle
5. Run `bundle install`
6. Run `rake db:setup`
7. Start application with `foreman start`

## API Examples

### Params
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
      "felt_in_la": true,
      "place": "12km NNE of Cabazon, CA",
      "created_at": "2018-01-31T07:44:15.164Z",
      "updated_at": "2018-01-31T07:44:15.164Z"
    }
}
```