menu= {burger: 3.99,
       taco: 5.96,
       chips: 0.50}

p menu[:sandwich]

menu[:sandwich]= 8.99

p menu

menu[:taco]=2.99

p menu


menu.store(:sushi, 7.88)

p menu
