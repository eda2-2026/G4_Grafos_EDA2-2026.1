$execute as @e[type=text_display,tag=bfs_display,distance=..1,limit=1] run data merge entity @s {text:{text:"$(dist)", color:"yellow"}}
