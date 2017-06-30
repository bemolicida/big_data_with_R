getwd()
setwd("/home/USERS/artur.palomino/sbartek/big_data_with_R/arturo_palomino")
source("readDataToMemory.R")
readInstacart()

library(DBI)
library(ggplot2)
library(ggthemes)

src_tbls(sc)


# find products that combines the most in a basket, then find independency in order to check that they combine because of some reason and not because they are two products that people buy a lot

order_products__prior %>% head(50)

order_products__prior %>%
  select(order_id, product_id) %>%
  left_join(orders, by="order_id") %>%
  filter(user_id <= 100) %>% 
  select(product_id, user_id) %>%
  group_by(user_id, product_id) %>%
  summarise(rating = n()) %>%
  rename(user = user_id) %>%
  mutate(item=product_id) %>%
  select(user, item, rating) ->
  user_item_rating

user_item_rating %>% head

explicit_model <- ml_als_factorization( user_item_rating, iter.max = 5, regularization.parameter = 0.01)

explicit_model


order_products__prior %>%
  colnames %>%
  print

orders %>%
  colnames %>%
  print

(explicit_model$user.factors) %>% dist -> matdist

explicit_model$user.factors %>%head

explicit_model$user.factors %>% select(paste("V",1:10,sep=""))  %>% head

explicit_model$user.factors %>% 
  mutate(all=1) %>% 
  left_join(explicit_model$user.factors %>% 
  mutate(all=1) , by="all") %>% 
  mutate(V1_=(V1.x-V1.y)^2,
         V2_=(V2.x-V2.y)^2,
         V3_=(V3.x-V3.y)^2,
         V4_=(V4.x-V4.y)^2,
         V5_=(V5.x-V5.y)^2,
         V6_=(V6.x-V6.y)^2, 
         V7_=(V7.x-V7.y)^2,
         V8_=(V8.x-V8.y)^2,
         V9_=(V9.x-V9.y)^2,
         V10_=(V10.x-V10.y)^2 ) %>% 
  select(id.x,id.y,V1_,V2_,V3_,V4_,V5_,V6_,V7_,V8_,V9_,V10_) %>%
  mutate(eucldist = rowSums(.[3:12])) %>%
  filter(id.x!=id.y)%>% head

email:    bartekskorulski@gmail.com


  mutate(dist = rowSums(.[1:5]))

df <- data.frame(a=sample(1:5, 10, replace=T), 
                 b=sample(1:5, 10, replace=T), 
                 c=sample(1:5, 10, replace=T), 
                 d=sample(1:5, 10, replace=T), 
                 grp=sample(1:3, 10, replace=T))
df %>%
  replace(is.na(.), 0) %>%
  mutate(sum = rowSums(.[1:5]))





