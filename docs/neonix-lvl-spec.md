
This is just for the meta post
```json
{
    "title" : "Level title",
    "description" : "Simple description",
    "username" : "username",
    "gameversion" : 0,
    "requestedDifficulty" : 0, // float range 0.5 -> 5.0
    "songID" : "000000"     // used to download the song from newgrounds
}
```

level content
```json
{
    "meta" : {
        "title" : "Level title",
        "description" : "Simple description",
        "username" : "username",
        "gameversion" : 0,
        "requestedDifficulty" : 0, // float range 0.5 -> 5.0
        "songID" : "000000"     // used to download the song from newgrounds,
        "textures" : [
            {
                "tag" : "tag",
                "data" : "[read the image data]->[encode to hex]->[b64 encrypt]->[gzip compress]->[encode to hex]",
            }
        ]
    },
    "level" : {
        "startPos" : [0, 0],
        "endPos" : [256, 0],
        "bgID" : 1,
        "bgColor" : [100, 100, 100],
        "defaultColor" : [255, 255, 255],
        "startGamemode" : "cube",
        "startSpeed" : 2,    // range from 1 to 4
        "startDirection" : "right",
        "startFlipped" : false
    },
    "objects" : [
    ],
    "objectThird" : [

    ]
}
```


object composition
```lua
{
    id = 0,
    x = 0,
    y = 0,
    r = 0,
    sx = 1,
    sy = 1,
    tid = 1
}
```