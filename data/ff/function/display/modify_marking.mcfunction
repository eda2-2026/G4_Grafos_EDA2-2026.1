data merge entity @s {billboard:"center", see_through:1b, Tags:["ff.display"]}
$execute if score markings ff matches 1 run data modify entity @s text set value "$(step)"
$scoreboard players set @s ff $(step)