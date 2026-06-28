$execute align xyz run summon text_display ~.5 ~.5 ~.5 {billboard:"center", see_through:1b, text:"$(counter)", Tags:["ff.display","temp"],data:{step:$(counter)}}

#$execute align xyz run summon text_display ~.5 ~1 ~.5 {billboard:"center", see_through:0b, text:"$(counter)", Tags:["ff.display","temp"],data:{step:$(counter)}}