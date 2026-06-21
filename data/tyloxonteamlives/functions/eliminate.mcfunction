# Add eliminated tag
tag @s add eliminated

# Alert player that they have been eliminated
title @s times 0.5s 5s 0.5s
title @s subtitle {"text":"Time to sit back and enjoy the show!","color":"gray"}
title @s title {"text":"You have been eliminated!","color":"red"}
