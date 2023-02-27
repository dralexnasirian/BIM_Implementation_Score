df <- df_sim

rel <- lm(y ~ . , data = df)
summary(rel)

install.packages("ggplot2")
library(ggplot2)

head(df)

co <- rel$coefficients[2:28]

co <- co*-100

co


#ggplot(data = co ,aes(x=no , y=co) ) +geom_col( ) + coord_flip() + theme_classic()

sub_enabler = c("Management supprt" , "User input" , "Vision" , "Implementation plan" , "Stake holder analysis" , "BIM policy" , 
            "Risk analysis" , "Collegial help" , "BIM expertise" , "Competency assessment" , "Learning by doing" , 
            "Community of practice" , "Learning from past" , "Change agent" , "User involvement" , "Open communication" , 
            "KM system" , "Technology" , "Organization linkage" , "Cross-functional cooperation",
            "Reward" , "User training" , "Supportive supervisor" , "Management readiness", 
            "Benchmarking tools" , "Maturity assessment" , "Benefit assessment")

sub_enabler

enabler <- c( rep("Strategic" , 7) , rep("Learning" , 6) , rep("Culture" , 3) , rep("Knowledge" , 2), 
   rep("Network",2) , rep("change" , 4) , rep("process",3) )

table(enabler)

df <- data.frame(sub_enabler=sub_enabler , enabler = enabler , co = co)
df

ggplot(data = df , aes(x= sub_enabler , y = co ) ) + geom_col( stat = "identity" )+ coord_flip() + theme_classic() 


getwd()

write.csv(df , "df.csv")
