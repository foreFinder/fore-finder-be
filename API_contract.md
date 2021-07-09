### POST Add Tee Time
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
| open_spots | number of spots | Yes - must be sent in body of request |
| number_of_holes | number of holes played | Yes - must be sent in body of request |
| host_id | id of player initiating event | Yes - must be sent in body of request |
| invitees | id of players invited | Yes - must be sent in body of request |
| private | limited to friends only? | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "course_id": 100,
    "date": "08/04/2021",
    "tee_time": "09:30",
    "open_spots": 1,
    "number_of_holes": "9",
    "private": true,
    "host_id": 1,
    "invitees": [2]
  }
```

Example Response:    
```json
{
  "data": {
      "id": 1,
      "type": "events",
      "attributes": {
        "course_id": 100,
        "date": "08/04/2021",
        "tee_time": "09:30",
        "open_spots": 1,
        "number_of_holes": "9",
        "private": true,
        "host_id": 1,
        "invitees": [2]
     }
   }
}
```

### POST Accept Tee Time
##### Resource URL
```
POST /api/v1/player-events
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| user_id | id of the user accepting tee time | Yes - must be sent in body of request |
| event_id | id of the event accpeted | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "user_id": 2,
    "event_id": 1
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
       "event_id": 1
     }
   }
}
```

