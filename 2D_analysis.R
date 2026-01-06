rm(list=ls())

setwd('/Users/jonathanteuffel/Desktop/')
df <- read.csv('Dimer_inc_rate_2d_1.csv',header=TRUE)

library(ggplot2)

library(dplyr)
data <- df %>% group_by(Concentration,System) %>%  summarise(average=mean(X1.2.saturation.reached.at.timestep),std=sd(X1.2.saturation.reached.at.timestep))
   
 
ggplot(aes(x=average,y=Concentration,color=System),data=data,)+
geom_point()+
  geom_line()+
  geom_errorbar(aes(xmin=average-std, xmax = average+std),size=0.5,width=2)+
  xlim(0.001,0.05)+ylim(0,0.00035)+
  xlab('Present in >= 50 % of voxels after [ms]')+
  ylab('Concentration product [mols/voxel]')+
theme_linedraw()


ggplot(aes(x=average,y=Concentration,color=System),data=data,)+
  geom_point()+
  geom_line()+
  geom_errorbar(aes(xmin=average-std, xmax = average+std),size=0.5,width=2)+
ylim(0,1E-4)+ xlim(0.001,0.02)+
  xlab('Present in >= 50 % of voxels after [ms]')+
  ylab('Concentration product [mols/voxel]')+
  theme_linedraw()

