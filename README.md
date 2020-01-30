# flora.ai
AI based crop identification app

Made by team 99 for Smart India Hackathon 2020


# Faux API service

## Usage

All responses will have the form

```json
{
    "id": "Unique identifier",
    "title": "A random title"
}
```

Below are the impleented methods, use Postman or something
similar to query them and test out


## Link to hosted service
https://todo-fpko6i4yjq-uc.a.run.app

### List all devices

**Definition**

`GET /list`

**Response**

- `200 OK` on success

```json
[
    {
        "id": "1",
        "title": "This is a random title"
    },
    {
        "id": "2",
        "title": "This is another random title"
    }
]
```

### Add a new device

**Definition**

`POST /add`

**Arguments**
```json
    {
        "id": "1",
        "title": "This is a random title"
    }
```

**Response**
- `200 OK` on success

```json
{
    "success": true
}
```

### Update a device

**Definition**
`POST /update`

**Arguments**
```json
{
    "id": "1",
    "title": "This is a random title"
}
```

**Response**
- `200 OK` on success

```json
{
    "success": true
}

```

### Delete a device 

**Definition**
`DELETE /delete`

**arguments**
```json
{
    "id": "1"
}

```
**Response**
- `200 OK` on success
```json
{
    "success": true
}
```













