### POST Add Tee Time
##### Resource URL
```
POST /api/v1/event
```
Request Parameters:
| Request Parameter | Description | Required? |
| --- | --- | --- |
| golf_course_id | id of the course that is booked | Yes - must be sent in body of request |
| date | date of tee time | Yes - must be sent in body of request |
| tee_time | tee time | Yes - must be sent in body of request |
| open_spots | number of spots | Yes - must be sent in body of request |
| number_of_holes | number of holes played | Yes - must be sent in body of request |
| host | id of person initiating event | Yes - must be sent in body of request |
| invites | id of players invited | Yes - must be sent in body of request |
| private | limited to friends only? | Yes - must be sent in body of request |

Example Request Body:
```json
  {
    "golf_course_id": 100,
    "date:" "08/04/2021",
    "tee_time:" "09:30",
    "open_spots": 2,
    "number_of_holes": "9",
    "host": 1,
    "invites": [2],
    "private": true
  }
```

Example Response:    
```json
{
  "data": {
      "id": 1,
      "type": "events",
      "attributes": {
        "golf_course_id": 100,
        "date:" "08/04/2021",
        "tee_time:" "09:30",
        "open_spots": 2,
        "number_of_holes": "9",
        "host": 1,
        "invites": [2],
        "private": true
     }
   }
}
```
