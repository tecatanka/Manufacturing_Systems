library(ggplot2)
library(reshape2)

C=0.1 # Dollars per unit
i=0.1 # 10% annual interest and depreciation rate
M=1000 # units per month
S= 2 # Dollars
P=12 #periods in a year

Q<-400:5200

#Set-up Cost per Unit
Set_Up_Cost<-S/Q

#Unit interest charge for interest and depreciation plus cost per unit. The cost pf carrying inventory per unit

Carrying_Cost<-(i/(2*P*M))*(C*Q+S)

#Total cost

Total_Cost<-Set_Up_Cost+Carrying_Cost

data<-data.frame(Q, Carrying_Cost, Set_Up_Cost, Total_Cost)

data_long <- melt(data, id = "Q") 

ggp2 <- ggplot(data_long,            # Create ggplot2 plot
               aes(x = Q,
                   y = value,
                   color = variable)) +
  geom_line()+
  xlim(400, 5200)+
  ylim(0,0.004)+
  xlab("Order Quantity Q")+
  ylab("Cost per Unit in Dollars")
ggp2                                 # Draw ggplot2 plot