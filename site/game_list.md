## Game List

Returns a list of games.

### Request

Headers should include:

    Accept: application/json

Example Request:

    GET /games
    GET /games?user_id=1234

Query Parameters:

* **user_id** (optional) - filter game list by user

### Example JSON Response

    HTTP/1.1 200 OK
    Date: Wed, 20 Feb 2013 22:40:10 GMT
    Content-Type: application/json; charset=utf-8
    Content-Length: 1024

    {
      "games": [
        {
          "id": "1234",
          "name": "RvB"
        },
        ...
      ]
    }

### Response Status

**200** - OK

### Game List Service Response Elements

