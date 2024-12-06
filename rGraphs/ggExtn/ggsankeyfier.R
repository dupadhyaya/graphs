#ggsankeyfier

#https://pepijn-devries.github.io/ggsankeyfier/

#install.packages("ggsankeyfier")
#devtools::install_github('pepijn-devries/ggsankeyfier')

library(ggsankeyfier)
data("ecosystem_services")

#concepts - aes(connector-from/to), edge size, stage, node

ggplot(ecosystem_services_pivot1,       aes(x = stage, y = RCSES, group = node, connector = connector, edge_id = edge_id)) +   geom_sankeyedge(v_space = "auto") + geom_sankeynode(v_space = "auto")

data("ecosystem_services")
head(ecosystem_services)
ggplot(ecosystem_services_pivot1,      aes(x = stage, y = RCSES, group = node,   connector = connector, edge_id = edge_id)) +   geom_sankeyedge(v_space = "auto") +   geom_sankeynode(v_space = "auto")
