# haskell-demo-api

## Quickstart

```sh
$ stack build
$ stack exec haskell-demo-api 8080
Listening on port 8080
```

## Routes

### `GET /`

#### Response

```JSON
{
    "message": "Hello World!"
}
```

### `GET /transform?string=Hello%20World!`

#### Response

```JSON
{
    "message": "olleH !dlroW"
}
```
