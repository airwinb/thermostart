#### API for Thermosmart server

<details>
 <summary><code>GET</code> <code><b>/thermostat/{id}</b></code> <code>(get all thermostat information)</code></summary>

##### Parameters

> | name | type | data type | description                                |
> |------|------|-----------|--------------------------------------------|
> | id   | path | string    | The id of the thermostat; Example: IT01234 |

##### Responses

> | http code | content-type                      | response                 |
> |-----------|-----------------------------------|--------------------------|
> | `200`     | `text/plain;charset=UTF-8`        | json response, see below |
> | `400`     | `text/plain;charset=UTF-8`        | `no activated device`    |

JSON response
```json
{
  "name": "IT01234",
  "room_temperature": 202,
  "target_temperature": 140,
  "outside_temperature": 19,
  "predefined_temperatures": {
    "anti_freeze": 50,
    "comfort": 215,
    "home": 180,
    "not_home": 150,
    "pause": 125
  },
  "standard_week": [
    {
      "start": [
        0,
        6,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        0,
        7,
        30
      ],
      "temperature": "not_home"
    },
    {
      "start": [
        0,
        17,
        0
      ],
      "temperature": "home"
    },
    {
      "start": [
        0,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        1,
        6,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        1,
        7,
        30
      ],
      "temperature": "not_home"
    },
    {
      "start": [
        1,
        17,
        0
      ],
      "temperature": "home"
    },
    {
      "start": [
        1,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        2,
        6,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        2,
        7,
        30
      ],
      "temperature": "not_home"
    },
    {
      "start": [
        2,
        17,
        0
      ],
      "temperature": "home"
    },
    {
      "start": [
        2,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        3,
        6,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        3,
        7,
        30
      ],
      "temperature": "not_home"
    },
    {
      "start": [
        3,
        17,
        0
      ],
      "temperature": "home"
    },
    {
      "start": [
        3,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        4,
        6,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        4,
        7,
        30
      ],
      "temperature": "not_home"
    },
    {
      "start": [
        4,
        17,
        0
      ],
      "temperature": "home"
    },
    {
      "start": [
        4,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        5,
        7,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        5,
        20,
        30
      ],
      "temperature": "pause"
    },
    {
      "start": [
        6,
        7,
        30
      ],
      "temperature": "home"
    },
    {
      "start": [
        6,
        20,
        30
      ],
      "temperature": "pause"
    }
  ],
  "exceptions": [
    
  ],
  "source": 3,
  "firmware": 30030131,
  "ot": {
    "enabled": 0,
    "raw": {
      "ot0": 0,
      "ot1": 0,
      "ot3": 0,
      "ot17": 0,
      "ot18": 0,
      "ot19": 0,
      "ot25": 0,
      "ot26": 0,
      "ot27": 0,
      "ot28": 0,
      "ot34": 0,
      "ot56": 0,
      "ot125": 0
    }
  }
}
```

##### Example cURL

> ```javascript
>  curl -X GET 'http://thermoserver.localdomain:3888/thermostat/IT01234'
> ```
</details>

<details>
 <summary><code>PUT</code> <code><b>/thermostat/{id}</b></code> <code>(set target temperature)</code></summary>

##### Parameters

> | name | type | data type | description                                |
> |------|------|-----------|--------------------------------------------|
> | id   | path | string    | The id of the thermostat; Example: IT01234 |

##### Data
Json data with the following properies
> | name               | data type | description                                                        |
> |--------------------|-----------|--------------------------------------------------------------------|
> | target_temperature | integer   | The actual temperature in tenth degrees; So 160 means 16.0 degrees |

Example:
```json
{
  "temperature": 160
}
```

##### Responses

> | http code | content-type                      | response              |
> |-----------|-----------------------------------|-----------------------|
> | `200`     | `text/plain;charset=UTF-8`        | `OK`                  |
> | `400`     | `text/plain;charset=UTF-8`        | `no activated device` |


##### Example cURL

> ```javascript
>  curl -X PUT -H "Content-Type: application/json" --data '{"target_temperature": 160}' http://thermoserver.localdomain:3888/thermostat/IT01234
> ```
</details>

<details>
 <summary><code>POST</code> <code><b>/thermostat/{id}/pause</b></code> <code>(pause the schedule)</code></summary>

##### Parameters

> | name | type | data type | description                                |
> |------|------|-----------|--------------------------------------------|
> | id   | path | string    | The id of the thermostat; Example: IT01234 |

##### Responses

> | http code | content-type                      | response              |
> |-----------|-----------------------------------|-----------------------|
> | `200`     | `text/plain;charset=UTF-8`        | `OK`                  |
> | `400`     | `text/plain;charset=UTF-8`        | `no activated device` |


##### Example cURL

> ```javascript
>  curl -X POST 'http://thermoserver.localdomain:3888/thermostat/IT01234/pause
> ```
</details>

<details>
 <summary><code>POST</code> <code><b>/thermostat/{id}/unpause</b></code> <code>(unpause the schedule)</code></summary>

After unpausing the thermostat it will go back to the target_temperature that was used when the thermostat was paused.

##### Parameters

> | name | type | data type | description                                |
> |------|------|-----------|--------------------------------------------|
> | id   | path | string    | The id of the thermostat; Example: IT01234 |

##### Responses

> | http code | content-type                      | response              |
> |-----------|-----------------------------------|-----------------------|
> | `200`     | `text/plain;charset=UTF-8`        | `OK`                  |
> | `400`     | `text/plain;charset=UTF-8`        | `no activated device` |


##### Example cURL

> ```javascript
>  curl -X POST 'http://thermoserver.localdomain:3888/thermostat/IT01234/unpause
> ```
</details>
