scoreboard objectives add ff dummy
scoreboard objectives add ff.config trigger
execute as @a unless items entity @s weapon.mainhand *[custom_data~{ff:true}] unless items entity @s weapon.offhand *[custom_data~{ff:true}] run function ff:tool/give