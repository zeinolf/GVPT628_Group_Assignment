library(tidyverse)

ess<-haven::read_dta(unz("data/ESS11.zip", "ESS11.dta"))|>
  haven::zap_missing()


plot<-ess|>
  mutate(trust_ep = as_factor(trstep))|>
  drop_na(trust_ep)|>
  ggplot(aes(x=trust_ep, weight = anweight)) + 
  geom_bar() +
  xlab("Trust in the European Parliament") +
  theme_bw() +
  facet_wrap(~cntry, scales='free_y') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




ggsave(plot, file='results/trust_ep.png',
       width=20, height=5
       ) 
