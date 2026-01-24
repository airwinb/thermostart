#### API for Thermosmart server

<details>
 <summary><code>GET</code> <code><b>/thermostat/{id}</b></code> <code>(get all thermostat information)</code></summary>

##### Parameters

> | name | type | data type | description                                |
> |------|------|-----------|--------------------------------------------|
> | id   | path | string    | The id of the thermostat; Example: IT01234 |

##### Headers

> | name         | value            |
> |--------------|------------------|
> | content-type | application/json |


##### Responses

> | http code | content-type                      | response                 |
> |-----------|-----------------------------------|--------------------------|
> | `200`     | `text/plain;charset=UTF-8`        | json response, see below |
> | `400`     | `text/plain;charset=UTF-8`        | `no activated device`    |

JSON response

> | name            | data type | description                                |
> |-----------------|-----------|--------------------------------------------|
> | xxx_temperature | integer   | The actual temperature in tenth degrees; So 215 means 21.5 degrees |
> | predefined_temperatures |   | List of preset with temperatures |
> | standard_week | array   | Default schedule of presets during the week. "start": [dayOfWeek, hour, minutes] |
> | source | integer    | 0 = CRASH, 1 = MANUAL (via thermostat), 2 = SERVER (via web), 3 = STD_WEEK, 4 = EXCEPTION (scheduled via web), 5 = PAUSE |
> | source_name         | string | [CRASH, MANUAL, SERVER, STD_WEEK, EXCEPTION, PAUSE] |
> | ot.ch_enabled       | boolean | Central Heating enabled. Parsed from ot.raw.ot0 |
> | ot.ch_active        | boolean | Central Heating active. Parsed from ot.raw.ot0 |
> | ot.dhw_active       | boolean | Domestic Hot Water active. Parsed from ot.raw.ot0 |
> | ot.flame_on         | boolean | Central Heating is burning. Parsed from ot.raw.ot0 |
> | ot.fault_indication | boolean | Parsed from ot.raw.ot0 |
> | ot.raw              |         | OpenTherm raw data values |

  <details>
    <summary>JSON response example</summary>

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
    {
      "start": [
        2026,
        0,
        23,
        17,
        45
      ],
      "end": [
        2026,
        0,
        23,
        22,
        15
      ],
      "temperature": "not_home"
    }    
  ],
  "source": 3,
  "firmware": 30030131,
  "ot": {
    "enabled": 0,
    "ch_enabled": true,
    "ch_active": true,
    "dhw_active": false,
    "flame_on": true,
    "fault_indication": false,
    "raw": {
      "ot0": 266,
      "ot1": 17920,
      "ot3": 16651,
      "ot17": 0,
      "ot18": 0,
      "ot19": 0,
      "ot25": 11210,
      "ot26": 0,
      "ot27": 0,
      "ot28": 9733,
      "ot34": 0,
      "ot56": 15360,
      "ot125": 768
    }
  }
}
```
  </details>

##### Example cURL

> ```javascript
>  curl -X GET 'http://thermoserver.localdomain:3888/thermostat/IT01234' -H 'content-type: application/json'
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
