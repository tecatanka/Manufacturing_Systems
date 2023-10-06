# MILLENIUM LIQUORS BETE NOIRE

# Weekly demand =45 cases over 50 weeks
# Annual cost of capital= 15%
# Cost per case=120 [=] $/case
# Shipping cost=290 [=] $/order
# Cost of labor to place and order=10 [=] $/order
# Fixed cost of refrigeration=75 [=] $/week

# Period is week, therefore the weekly holding cost is a function of the 
# cost per unit and weekly cost of capital

i<-0.15/50  # weekly cost of capital
print(i)

c<- 120  # cost per case
print(c)
h<- c*i  # holding cost
print(h)

k<-290+10 # Ordering cost
print(k)

d<-45 # demand per week
print(d)

# Import SCperf package
library(SCPerf)
#EOQ function description. Look at help too.
# EOQ(d, k, h, b = 0)
# Arguments
# d	
# Demand per unit time.
# 
# k	
# Ordering or fixed cost per order.
# 
# h	
# Holding cost per unit of product.
# 
# b	
# Shortage penalty cost per unit (default:0)

#Results obtained:
# A list containing:
#   T	
# Time between orders (cycle length)
#  S	
# Maximum backorders in units. Displayed when b > 0
# TVC	
# Total variable cost.


Q_splat<- EOQ(d,k,h) #Economic Order Quantity
print(Q_splat)
