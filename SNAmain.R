# Housekeeping ------------------------------------------------------------
library(openxlsx)
library(tidyverse)
library(networkD3)
library(htmlwidgets)

# Data --------------------------------------------------------------------
DF <- read.xlsx(xlsxFile = "cn-export-all-11-15-2023.xlsx", sheet = "selection")
str(DF)

#col_names <- names(DF)
#col_select <- c(1, 5, 8:10, 12:14, 36:39, 55, 57, 59, 61, 65, 69, 73)
#col_names_select <- col_names[col_select]
#DFfinal <- DF %>% select(all_of(col_names[col_select]))

# Sankey diagram ----------------------------------------------------------
ARCTOS_links <- read.xlsx(xlsxFile = "ARCTOS_Post-Doc_Sankey.xlsx", sheet = "D3_Links")
ARCTOS_nodes <- read.xlsx(xlsxFile = "ARCTOS_Post-Doc_Sankey.xlsx", sheet = "D3_Nodes")

p <- sankeyNetwork(Links = ARCTOS_links - 1, Nodes = ARCTOS_nodes,
                   Source = "source", Target = "target",
                   Value = "value",
                   NodeID = "name", units = "TWh",
                   fontSize = 12, nodeWidth = 10)
p

saveWidget(p, file=paste0( getwd(), "/Sankey_ARCTOS.html"))




