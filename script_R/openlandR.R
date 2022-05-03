### Instruções https://cran.r-project.org/web/packages/OpenLand/vignettes/openland_vignette.html

# Instalação 
install.packages(OpenLand)
install.packages(contingenceTable)

# first we load the OpenLand package
library(OpenLand)

# downloading the SaoLourencoBasin multi-layer raster and make it available into R
url <- "https://zenodo.org/record/3685230/files/SaoLourencoBasin.rda?download=1"

temp <- tempfile()
download.file(url, temp, mode = "wb") # downloading the SaoLourencoBasin dataset
load(temp)

SaoLourencoBasin
#> class      : RasterStack 
#> dimensions : 6372, 6546, 41711112, 5  (nrow, ncol, ncell, nlayers)
#> resolution : 30, 30  (x, y)
#> extent     : 654007.5, 850387.5, 8099064, 8290224  (xmin, xmax, ymin, ymax)
#> crs        : +proj=utm +zone=21 +south +ellps=GRS80 +units=m +no_defs 
#> names      : landscape_2002, landscape_2008, landscape_2010, landscape_2012, landscape_2014 
#> min values :              2,              2,              2,              2,              2 
#> max values :             13,             13,             13,             13,             13


my_test <- intensityAnalysis(dataset = SL_2002_2014, # here the outcome from the `contingenceTable()` function
                             category_n = "Ap", category_m = "SG")

library(MASS)


contingenceTable(input_raster = SaoLourencoBasin, pixelresolution = 30)

testSL <- intensityAnalysis(dataset = SL_2002_2014,
                            category_n = "Ap", category_m = "SG")

# it returns a list with 6 objects
names(testSL)

# showing the objects from the intensity analysis for our illustrative case
testSL

# Interval Level
plot(testSL$interval_lvl,
     labels = c(leftlabel = "Interval Change Area (%)",
                rightlabel = "Annual Change Area (%)"),
     marginplot = c(-8, 0), labs = c("Changes", "Uniform Rate"), 
     leg_curv = c(x = 2/10, y = 3/10))

#Nível da categoria
plot(testSL$category_lvlGain,
     labels = c(leftlabel = bquote("Gain Area (" ~ km^2 ~ ")"),
                rightlabel = "Intensity Gain (%)"),
     marginplot = c(.3, .3), labs = c("Categories", "Uniform Rate"), 
     leg_curv = c(x = 5/10, y = 5/10))
plot(testSL$category_lvlLoss,
     labels = c(leftlabel = bquote("Loss Area (" ~ km^2 ~ ")"),
                rightlabel = "Loss Intensity (%)"),
     marginplot = c(.3, .3), labs = c("Categories", "Uniform Rate"), 
     leg_curv = c(x = 5/10, y = 5/10))

#Nível de transição

plot(testSL$transition_lvlGain_n,
     labels = c(leftlabel = bquote("Gain of Ap (" ~ km^2 ~ ")"),
                rightlabel = "Intensity Gain of Ap (%)"),
     marginplot = c(.3, .3), labs = c("Categories", "Uniform Rate"), 
     leg_curv = c(x = 5/10, y = 5/10))


#Perda da mcategoria ("SG")

plot(testSL$transition_lvlLoss_m,
     labels = c(leftlabel = bquote("Loss of SG (" ~ km^2 ~ ")"),
                rightlabel = "Intensity Loss of SG (%)"),
     marginplot = c(.3, .3), labs = c("Categories", "Uniform Rate"), 
     leg_curv = c(x = 1/10, y = 5/10))


# Ganhos e perdas líquidos e brutos
netgrossplot(dataset = SL_2002_2014$lulc_Multistep,
             legendtable = SL_2002_2014$tb_legend,
             xlab = "LUC Category",
             ylab = bquote("Area (" ~ km^2 ~ ")"),
             changesLabel = c(GC = "Gross changes", NG = "Net Gain", NL = "Net Loss"),
             color = c(GC = "gray70", NG = "#006400", NL = "#EE2C2C")
)


# Diagrama de acordes (2002-2014)
chordDiagramLand(dataset = SL_2002_2014$lulc_Onestep,
                 legendtable = SL_2002_2014$tb_legend)

# Sankey Multi Step

sankeyLand(dataset = SL_2002_2014$lulc_Multistep,
           legendtable = SL_2002_2014$tb_legend)


# Um gráfico de barras Evolution

barplotLand(dataset = SL_2002_2014$lulc_Multistep, 
            legendtable = SL_2002_2014$tb_legend,
            xlab = "Year",
            ylab = bquote("Area (" ~ km^2~ ")"),
            area_km2 = TRUE)

#summary_map()

testacc <- acc_changes(SaoLourencoBasin)
