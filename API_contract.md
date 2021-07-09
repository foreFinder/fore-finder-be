
POST /api/v1/event - host creates a tee time
GET /api/v1/event/{event_id} - fetch details for a specific tee time (includes details on invites accepted)
POST /api/v1/player-events - accept or decline invitation
GET /api/v1/players - fetch details for all players

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
### GET Tee Time ()
##### Resource URL
```
GET /api/v1/event/{event_id}
```
Example Response:    
```json
{
  "data": {
      "id": 1,
      "type": "event",
      "attributes": {
        "course_id": 100,
        "date": "08/04/2021",
        "tee_time": "09:30",
        "open_spots": 2,
        "number_of_holes": "9",
        "private": true,
        "host_id": 1,
        "invitees": [2, 3],
        "players": [2]
     }
   }
}
```

### POST Accept or Decline Tee Time
##### Resource URL
```
POST /api/v1/player-events
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| user_id | id of the user accepting tee time | Yes - must be sent in body of request |
| event_id | id of the event accpeted | Yes - must be sent in body of request |
| invite_accepted | true or false | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "user_id": 2,
    "event_id": 1,
    "invite_accepted": true
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
       "invite_accepted": true
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
  "data": {
      "id": 1,
      "type": "players",
      "attributes": [
        {
         "player_id": 1,
         "name": "Eric Rabun'",
         "friends": 1,
         "events": [1]
        },
        {
         "player_id": 2,
         "name": "Tyson McNutt",
         "friends": 1,
         "events": []
        }
      ]
   }
}
```
