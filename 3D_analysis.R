rm(list=ls())

setwd('/Users/jonathanteuffel/Desktop/Diff_eq_tst1/results')
df <- read.csv('Dimer_inc_rate_3d1.csv',header=TRUE)

library(ggplot2)

library(dplyr)
data <- df %>% group_by(Concentration,System) %>%  summarise(average=mean(X1.2.saturation.reached.at.timestep),std=sd(X1.2.saturation.reached.at.timestep))

 
ggplot(aes(x=average,y=Concentration,color=System),data=data,)+
geom_point()+
  geom_line()+
  geom_errorbar(aes(xmin=average-std, xmax = average+std),size=0.5,width=2)+
  xlim(1E-100,0.035)+ylim(0,0.000008)+
  xlab('Present in >= 50 % of voxels after [ms]')+
  ylab('Concentration product [mols/voxel]')+
theme_linedraw()


ggplot(aes(x=average,y=Concentration,color=System),data=data,)+
  geom_point()+
  geom_line()+xlim(1E-100,0.09)+
  geom_errorbar(aes(xmin=average-std, xmax = average+std),size=0.5,width=2)+
  xlab('Present in >= 50 % of voxels after [ms]')+
  ylab('Concentration product [mols/voxel]')+
  theme_linedraw()

