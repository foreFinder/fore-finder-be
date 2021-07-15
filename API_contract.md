## API Endpoints

Request Parameters:

| HTTP Verb | Path | Use Case |
| --- | --- | --- |
| GET | /api/v1/courses | returns all courses available for user to select from |
| GET | /api/v1/events | returns all available events, including ability to limit to events open to community, use to populate host view |
| POST | /api/v1/event | creates a new tee-time (event) |
| GET | /api/v1/event/{event_id} | fetch details for a specific tee time (includes details on invites accepted) |
| GET  | /api/v1/players | fetch details for all players |
| GET | /api/v1/players/{player_id}/events | fetch all events for a single player |
| POST | /api/v1/player-events | accept or decline invitation |

### GET All courses detail
##### Resource URL
```
GET /api/v1/courses
```
Example Response:    
```json
{
  "data": [
    {
        "id": "1",
        "type": "course",
        "attributes": {
            "name": "Green Valley Ranch Golf Club",
            "street": "4900 Himalaya Road",
            "city": "Denver",
            "state": "Colorado",
            "zip_code": "80249",
            "phone": "303.371.3131",
            "cost": "80"
          }
    },
    {
        "id": "2",
        "type": "course",
        "attributes": {
            "name": "City Park Golf Course",
            "street": "3181 E. 23rd Avenue",
            "city": "Denver",
            "state": "Colorado",
            "zip_code": "80205",
            "phone": "720.865.3410",
            "cost": "65"
        }
    },
    {
          "id": "3",
          "type": "course",
          "attributes": {
              "name": "Riverdale Golf Club",
              "street": "13300 Riverdale Road",
              "city": "Brighton",
              "state": "Colorado",
              "zip_code": "80602",
              "phone": "303.659.4700",
              "cost": "74"
          }
    },
    {
          "id": "4",
          "type": "course",
          "attributes": {
              "name": "Willis Case Golf Course",
              "street": "4999 Vrain Street",
              "city": "Denver",
              "state": "Colorado",
              "zip_code": "80212",
              "phone": "720.865.0700",
              "cost": "58"
          }
    }
  ]
}
```
### GET All Events
##### Resource URL
```
GET /api/v1/events
```
Optional - add query parameter to only show public events
```
GET /api/v1/events?private=false
```

Example Response:    
```json
{
    "data": [
        {
            "id": "1",
            "type": "event",
            "attributes": {
                "course_id": 1,
                "date": "08-01-2021",
                "tee_time": "13:20",
                "open_spots": 3,
                "number_of_holes": "9",
                "private": true,
                "host_name": "Amy",
                "accepted": [
                    1,
                    2,
                    3
                ],
                "declined": [],
                "pending": [
                    4
                ],
                "remaining_spots": 0
            }
        },
        {
            "id": "2",
            "type": "event",
            "attributes": {
                "course_id": 2,
                "date": "08-05-2021",
                "tee_time": "14:20",
                "open_spots": 4,
                "number_of_holes": "18",
                "private": true,
                "host_name": "Andrew",
                "accepted": [
                    2,
                    1,
                    3,
                    6
                ],
                "declined": [],
                "pending": [],
                "remaining_spots": 0
            }
        },
        {
            "id": "3",
            "type": "event",
            "attributes": {
                "course_id": 3,
                "date": "08-10-2021",
                "tee_time": "15:20",
                "open_spots": 2,
                "number_of_holes": "9",
                "private": false,
                "host_name": "Amber",
                "accepted": [
                    3
                ],
                "declined": [
                    4
                ],
                "pending": [],
                "remaining_spots": 1
            }
        }
    ]
}
```

### POST Host & Add Tee Time (#13, #21)
##### Resource URL
```
POST /api/v1/event
```
Request Parameters:

| Request Parameter | Description | Required? |
| --- | --- | --- |
| course_id | id of the course that is booked | Yes - must be sent in body of request |
| date | date of tee time | Yes - must be sent in body of request |
| tee_time | tee time | Yes - must be sent in body of request |
| open_spots | max number of spots (including the host) | Yes - must be sent in body of request |
| number_of_holes | number of holes played | Yes - must be sent in body of request |
| private | limited to friends only? | Yes - must be sent in body of request |
| host_id | id of player initiating event | Yes - must be sent in body of request |
| invitees | id of players invited | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "course_id": 1,
    "date": "08-04-2021",
    "tee_time": "09:30",
    "open_spots": 4,
    "number_of_holes": "9",
    "private": true,
    "host_id": 4,
    "invitees": [6]
  }
```

Example Response:    
```json
{
    "data": {
        "id": "4",
        "type": "event",
        "attributes": {
            "course_id": 1,
            "date": "08-04-2021",
            "tee_time": "09:30",
            "open_spots": 4,
            "number_of_holes": "9",
            "private": true,
            "host_name": "Betty",
            "accepted": [
                4
            ],
            "declined": [],
            "pending": [
                6
            ],
            "remaining_spots": 3
        }
    }
}
```

### GET Tee Time ()
##### Resource URL
```
GET /api/v1/event/{event_id}
```
Example Response:    
```json
{
  "data": {
      "id": "2",
      "type": "event",
      "attributes": {
          "course_id": 2,
          "date": "08-05-2021",
          "tee_time": "14:20",
          "open_spots": 4,
          "number_of_holes": "18",
          "private": true,
          "host_name": "Andrew",
          "accepted": [
              2,
              1,
              3,
              6
          ],
          "declined": [],
          "pending": [],
          "remaining_spots": 0
      }
  }
```

### POST Accept or Decline Tee Time
##### Resource URL
```
POST /api/v1/player-event
```
Request Parameters:

| Request Parameter | Description | Required? |
| --- | --- | --- |
| user_id | id of the user accepting tee time | Yes - must be sent in body of request |
| event_id | id of the event accpeted | Yes - must be sent in body of request |
| invite_status | accepted, declined | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "user_id": 2,
    "event_id": 1,
    "invite_status": "declined"
  }
```

Example Response:    
```json
{
  "data": {
      "id": 1,
      "type": "player-events",
      "attributes": {
       "user_id": 2,
       "event_id": 1,
       "invite_status": "declined"
     }
   }
}
```
### GET All Player Details ()
##### Resource URL
```
GET /api/v1/players
```
Example Response:    
```json
{
  "data": [
      {
          "id": "1",
          "type": "players",
          "attributes": {
            "name": "Eric Rabun",
            "friends": [
                2,
                3,
                4,
                5,
                6
            ],
            "events": [
                2
            ]
          }
      },
      {
          "id": "2",
          "type": "players",
          "attributes": {
            "name": "Tyson McNutt",
            "friends": [
                1,
                3,
                4,
                5,
                6
            ],
            "events": [
                1
            ]
          }
      }
  ]
}
```
