
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
        "requestedDifficulty" : 0, // int range 1 -> 5
        "songID" : "000000",     // used to download the song from newgrounds,
        "textures" : [
            {
                "tag" : "tag",
                "data" : "[read the image data]->[encode to hex]->[gzip compress]->[encode to hex]",
            }
        ]
    },
    "level" : {
        "startPos" : [0, 0],
        "endPos" : [256, 0],
        "bgID" : 1,
        "colorChannels" : {
            "reserved" : {
                "bg" : [128, 128, 128],
                "objs" : [255, 255, 255]
            }
        },
        "startGamemode" : "cube",
        "startSpeed" : 2,    // range from 1 to 4
        "startDirection" : "right",
        "startFlipped" : false
    },
    "objects" : [],
    "objectThird" : []
}
```


object composition (2D)
`id:0;x:0;y:0;r:0;sx:1;sy:1;tid:1;tag:""`

object composition (3D)
`mid:0;px:0;py:0;pz:0;rx:0;ry:0;rz:0;sx:0;sy:0;sz:0;actid:0;`