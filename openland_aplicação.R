### Instruções https://cran.r-project.org/web/packages/OpenLand/vignettes/openland_vignette.html

# Instalação 
install.packages(OpenLand)

# first we load the OpenLand package
library(OpenLand)

# downloading the SaoLourencoBasin multi-layer raster and make it available into R
#url <- "https://zenodo.org/record/3685230/files/SaoLourencoBasin.rda?download=1"

#temp <- tempfile()
#download.file(url, temp, mode = "wb") # downloading the SaoLourencoBasin dataset
#load(temp)

#SaoLourencoBasin
#> class      : RasterStack 
#> dimensions : 6372, 6546, 41711112, 5  (nrow, ncol, ncell, nlayers)
#> resolution : 30, 30  (x, y)
#> extent     : 654007.5, 850387.5, 8099064, 8290224  (xmin, xmax, ymin, ymax)
#> crs        : +proj=utm +zone=21 +south +ellps=GRS80 +units=m +no_defs 
#> names      : landscape_2002, landscape_2008, landscape_2010, landscape_2012, landscape_2014 
#> min values :              2,              2,              2,              2,              2 
#> max values :             13,             13,             13,             13,             13


setwd("D:/OneDrive/TESE/Artigo 2/RASTER")
#Instalação
install.packages(c("raster", "rcolorbrewer", "viridis", "cptcity", "tmap"), 
                 dependencies = TRUE)
install.packages("raster")
install.packages("sp")
install.packages("lulcc")
install.packages("ggcorrplot")
install.packages("rgdal")
install.packages("lidR")



# preparate r -------------------------------------------------------------
# packages
library(raster) # raster
library(tmap) # thematic maps
library(cptcity) # escala de cores
library(viridis) # escala de cores
library(raster)
require(raster)
library(sp)
require(rgdal)





# Importar imagens -------------------------------------------------------

setwd("D:/OneDrive/TESE/Artigo 2/RASTER")

# Uso
uso_2000<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Usoocup_2000.tif")
uso_2010<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Usoocup_2010.tif")
uso_2018<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Usoocup_2018.tif")

# Dados Socio-economicos

ivs_2000<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_2000.tif")
ivs_2010<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_2010.tif")
ivs_2000_infr<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_INFRA_2000.tif")
ivs_2010_infr<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_INFRA_2010.tif")
ivs_2000_rend<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_REND_2000.tif")
ivs_2010_rend<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_REND_2010.tif")
ivs_2000_CPH<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_CPH_2000.tif")
ivs_2010_CPH<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/IVS/IVS_CPH_2010.tif")
# Densidade Populacional
dens_pop_2000<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Densidade Populacional/Dens_pop_2000.tif")
dens_pop_2010<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Densidade Populacional/Dens_pop_2010.tif")
# Valor da Terra Nua
vtn<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/VTN/VTN_medio.tif")

# Ocupação Irregular
ocup_irreg_2000<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Ocupação Irregular/ocup_2000.tif")
ocup_irreg_2010<-raster("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Ocupação Irregular/ocup_2010_2.tif")

# informacoes do raster ---------------------------------------------------
# objeto


# extensao
extent(uso_2000)
extent(uso_2010)
extent(uso_2018)

# nrow, ncol, ncell
nrow(uso_2000)
ncol(uso_2000)
ncell(uso_2000)

# resolucao
res(uso_2000)

# projecao
projection(uso_2000) # string ou character
crs(uso_2000) # argumento de crs
crs(uso_2010) # argumento de crs
crs(uso_2018) # argumento de crs
# names
names(uso_2000)
names(uso_2000)
names(uso_2018)

# values
values(uso_2000)
values(uso_2010)
values(uso_2018)

# values
uso_2000[]


#União camadas ----------------------------------------------------------------
uso<-stack(uso_2000,
            uso_2010,
            uso_2018)



# correlação entre Raster ------------------------------------------------
# Comparar raster
compareRaster(ivs_2000,ivs_2010)
compareRaster(ef_001,ef_003)
compareRaster(ef_002,ef_003)

# Converte em stack
ivs_stack<-stack(ivs_2000,ivs_2010,ivs_2000_infr,ivs_2010_infr,
                 ivs_2000_rend,ivs_2010_rend,ivs_2000_CPH,ivs_2010_CPH,
                 dens_pop_2000,dens_pop_2010,vtn)

teste_stark<-stack(ocup_irreg_2000,ocup_irreg_2010)

# Matriz
jnk<-layerStats(ivs_stack,'pearson', na.rm = T)
corr_matrix=jnk$'pearson correlation coefficient'
corr_matrix

# Média
jnk$mean

jnk$`pearson correlation coefficient`

# Dataframe Matriz de correlação
correl<-data.frame(corr_matrix)

# Arrendondar 
round(corr_matrix,2) # arrendonda para 2 casas decimais

# Gráfico de Correlação

cor.res<-round(corr_matrix,2)

library(ggcorrplot)
ggcorrplot(cor.res)

ggcorrplot(cor.res, type = "lower") # Exibir a parte inferior

# Organização por Similaridade

ggcorrplot(cor.res, type = "lower",
           hc.order = TRUE,
           method = "circle",
           lab=TRUE,
           lab_size = 3,
           colors = c("firebrick","white","dodgerblue4"),
           title = "Matriz de Correlação",
           ggtheme = theme_bw)






#lulcc -----------------------------------------------------------------------

library(lulcc)
#data ( pie )
obs  <- ObsLulcRasterStack ( x = uso ,
                             pattern = " lu " ,
                             categories = c ( 1 , 2 , 3, 4, 5, 6),
                             labels = c ( "1.Floresta " , "2.Formação Natural não Florestal " , "3.Agropecuária", "4.Área Não Vegetada", "5.Corpo dágua ", "6.Ocupação sobre a Faixa de Domínio" ),
                             t = c (2000 , 2010, 2018))

plot(obs)

# Matriz Transição -----------------------------------------------------

# obtain a transition matrix from land use maps for 2000 and 2010

crossTabulate(obs, times=c(2000,2010))

# obtain a transition matrix from land use maps for 2010 and 2018

crossTabulate(obs, times=c(2010,2018))

# obtain a transition matrix from land use maps for 2000 and 2018

crossTabulate(obs, times=c(2000,2018))

# Criar um dataframe
#matriz<-data.frame(crossTabulate ( obs , times = c ( 200 , 2010)))

# create a vector with the land use classes IN ORDER
lu <- c( "1.Floresta " , "2.Formação Natural não Florestal " , "3.Agropecuária", "4.Área Não Vegetada", "5.Corpo dágua ", "6.Ocupação sobre a Faixa de Domínio" )

#------------------------- Plilhar raster em R------------------------
#Um RasterStack pode conectar vários objetos raster escritos em arquivos diferentes ou na memória.
#nlcd.stack <- stack(nlcd.2000,nlcd.2010,nlcd.2018,ef_001,ef_002,ef_003)
nlcd.stack <- stack(uso_2000,uso_2010,uso_2018)


library(dplyr)
# Tornar lista
camadas<-as.list(nlcd.stack)
camadas

#---------Camada Única--------------------------------------------------------------------------

s <- stack(camadas)
#números de Layer
nlayers(s)
# nome dos layer
names(s)
names(s) <- c('uso_2000','uso_2010', 'uso_2018')
s
labels(s)


# RasterBrink --------------------------------------------------
#nlcd.brick<-brick(nlcd.2000,nlcd.2010,nlcd.2018,ef_001,ef_002,ef_003)


nlcd.brick<-brick(uso_2000,uso_2010,uso_2018)


nlcd.stack@layers


#view histogram of all 3 bands---------------------------------
hist(nlcd.stack,
     maxpixels=ncell(uso_2000))

# revert to a single plot layout-------------------------------
par(mfrow=c(1,1))


# plot band  -------------------------------------------------
plot(nlcd.stack[[1]],
     main="Uso e Ocupação em 2000")


plot(nlcd.stack[[2]],
     main="Uso e Ocupação em 2010")

plot(nlcd.stack[[3]],
     main="Uso e Ocupação em 2018")


# Create an RGB image from the raster stack
plotRGB(nlcd.stack,
        r = 20, g = 50, b = 60)

# create histograms of each raster
hist(nlcd.stack,
     xlim = c(0, 7))

# quantidade de layers
nlayers(nlcd.stack)


# nrow, ncol, ncell
nrow(nlcd.stack)


# resolucao
res(nlcd.stack$Usoocup_2000)
res(nlcd.stack$Usoocup_2010)
res(nlcd.stack$Usoocup_2018)


# projecao
projection(nlcd.stack) # string ou character
crs(nlcd.stack) # argumento de crs

# exemplo compare Raster()

compareRaster(nlcd.stack$Usoocup_2000, nlcd.stack$Usoocup_2010)
compareRaster(nlcd.stack$Usoocup_2010, nlcd.stack$Usoocup_2018)
compareRaster(nlcd.stack$Usoocup_2000, nlcd.stack$Usoocup_2018)

# names
names(nlcd.stack)

# VER OS ATRIBUTOS DAS CAMADAS
nlcd.stack@layers

# use ctable matrices as conditional probability values
install.packages("gRain")
library("gRain")

lu_2000 <- cptable(~lu_2000, values=c(lu.area.2000[,2]), levels=lu)

# set the target
target <- 'uso_2010'

# make a vector of the data without the target (2011 lan use layer)
spatialData <- c(nlcd.stack$Usoocup_2000, 
                 nlcd.stack$Usoocup_2010)

spatialData

library(bnspatial)

bn <- bnspatial(network, target, spatialData , lookup, msk=(nlcd.stack$<100))
                 
# nlcd.stack$lu_2011)  Why don't we remove this, since it is predicted?
#paste0('lu_2006.tif'),
#paste0('lu_2011.tif'))




# create a grayscale color palette to use for the image.-----------------------
grayscale_colors <- gray.colors(100,            # number of different color levels
                                start = 0.0,    # how black (0) to go
                                end = 1.0,      # how white (1) to go
                                gamma = 2.2,    # correction between how a digital
                                # camera sees the world and how human eyes see it
                                alpha = NULL)   #Null=colors are not transparent




# Maskara

uso_2000_masc<-mask(uso_2000, uso_2000<2)


# Codificação

teste <- ratify(uso_2000)

# Modify the RAT with the labels

nivel<-levels(teste)[[1]]
nivel$code<-c("x","y","Z","D","j","k")

levels(teste)<-nivel

uso.stack<-stack(uso_2000,uso_2010)

# Analise



# Variaveis Sociais e Economicos ----------------------------------------------------------------------

diretorio <- "D:/onedrive/UFPE/DOUTORADO/RSTUDIO/BR_408/DATASET_BR408/dados_lucc"
arquivos<- list.files(diretorio,
                      full.names = TRUE,
                      pattern = ".tif$")

arquivos

nlcd.2000<-raster::raster(uso_2000)
nlcd.2010<-raster::raster(uso_2010)
nlcd.2018<-raster::raster(uso_2018)
ef_001<-raster::raster(ivs_2000)
ef_002<-raster::raster(ivs_2010)
ef_003<-raster::raster(ivs_2010_rend)

library(sp)
library(raster)


ef.stack<-stack(ef_001,ef_002,ef_003)
uso.stack<-stack(uso_2000,uso_2010,uso_2018)

as.list(uso.stack)
as.list(ef.stack)

s <- stack(uso.stack)

ef <- ExpVarRasterList(s, pattern="X104" )
ef


setwd("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/")

ed<-"D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land"

# Ver os arquivos na pasta

summary_dir("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/")

# Definição do Tamanho do Pixel --------------------------------------------
summary_map("D:/OneDrive/TESE/Artigo 2/Reclassificação_Bytes/Padrão Open_land/Usoocup_2000.tif")

# Listar dados

list.files()
# Ver os arquivos na pasta

list.files( pattern = ".tif$")

# Open Land----------------------------------------------------------------

library(OpenLand)

SL_2000_2010 <- contingencyTable(input_raster =ed,
                                 pixelresolution = 200)


base::summary(SL_2000_2010)


SL_2000_2010$lulc_Multistep


SL_2000_2010$tb_legend

# Mudar Legenda

SL_2000_2010$tb_legend$categoryName<-c("1.Floresta " , "2.Formação Natural não Florestal " , "3.Agropecuária", "4.Área Não Vegetada", "5.Corpo dágua ", "6.Ocupação sobre a Faixa de Domínio")

SL_2000_2010$totalInterval<-10


# os nomes das classes

install.packages("rcartocolor")
rcartocolor::metacartocolors

SL_2000_2010$tb_legend$categoryName <- factor(c("01", "02", "03", "04", 
                                                "05", "06"),
                                       levels = c("01", "02", "03", "04", 
                                                  "05", "06"))
                                                         
# as cores
SL_2000_2010$tb_legend$color <- c("#228B22", "#24ffef", "#FFE4B5", "#a933ca", 
                                  "#01019d", "#060002")

# ("#FFE4B5", "#228B22", "#00FF00", "#CAFF70", 
# "#EE6363", "#00CD00")



# the plot
barplotLand(dataset = SL_2000_2010$lulc_Multistep,
            legendtable = SL_2000_2010$tb_legend,
            area_km2 = TRUE)

# Legenda

SL_2000_2010$tb_legend

library(OpenLand)
testacc <- acc_changes(path = ed)

testacc


chordDiagramLand(dataset = SL_2000_2010$lulc_Onestep,
                 legendtable = SL_2000_2010$tb_legend, 
                 legposition = c(x = -1.3, y = 0),
                 sectorcol = "gray80",
                 legtitle = "Classes", 
                 legendsize = 0.6,
                 x.margin = c(-1, 1)
)


# Passagem de Todos os Times -----------------------------------
sankeyLand(dataset = SL_2000_2010$lulc_Multistep,
           legendtable = SL_2000_2010$tb_legend)

# Passagem entre 2010 e 2018 -----------------------------------

sankeyLand(dataset = SL_2000_2010$lulc_Onestep,
           legendtable = SL_2000_2010$tb_legend)



# Iintensidade -------------------------------------------------

testSL <- intensityAnalysis(dataset = SL_2000_2010,
                            category_n = "Ap", category_m = "SG",
                            area_km2 = TRUE)

# Contigencia ---------------------------------------------------

contingencyTable ( input_raster=SL_2000_2010, pixelresolution  = 200 )


# create a list of the RasterLayers that are observations
obs <- ObsLulcRasterStack(nlcd.stack[[1:3]],
                          categories=c(1,2,3,4,5,6), 
                          labels=c("1.Floresta " , "2.Formação Natural não Florestal " , "3.Agropecuária", "4.Área Não Vegetada", "5.Corpo dágua ", "6.Ocupação sobre a Faixa de Domínio" ))                
                          t=c(200,2010,2018)

# create a vector with the land use classes IN ORDER ----------------
  lu <- c("1.Floresta " , "2.Formação Natural não Florestal " , "3.Agropecuária", "4.Área Não Vegetada", "5.Corpo dágua ", "6.Ocupação sobre a Faixa de Domínio" )


part <- partition(x=obs@maps[[1]], size=0.5, spatial=FALSE)
  


br <- raster::layerize(obs@maps[[1]])


# Análise de Intensidade ----------------------------------------------------


testSL <- intensityAnalysis(dataset = SL_2000_2010, # here the outcome from the `contingenceTable()` function
                             category_n = "6.Ocupação sobre a Faixa de Domínio", category_m = "6")



summary(testSL)


# Nível de Intervalo (plot)

plot(testSL$interval_lvl,
     labels = c(leftlabel = "Mudança de area por intervalo (%)",
                rightlabel = "Mudança anual de área (%)"),
     marginplot = c(-20, 0), labs = c("Mudanças", "Intensidade Uniforme"), 
     leg_curv = c(x = .1, y = .1))


testSL$category_lvlGain

testSL$category_lvlLoss

testSL$interval_lvl

testSL$transition_lvlGain_n

# Nível de Categoria (Estacionariedade)


testSL$category_lvlLoss@categoryStationarity


testSL$category_lvlGain@categoryStationarity

#Nível de Trasição (Estacionariedade)-----------------------------------------

testSL$transition_lvlGain_n@transitionStationarity

testSL$transition_lvlLoss_m@transitionStationarity



#Carregar o shapefile ----------------------------------------------------------

PE= readOGR("PE/PE_Municipios_2019.shp")

plot(PE)





library(MASS)


contingenceTable(input_raster =uso.stack, pixelresolution = 30)

testSL <- intensityAnalysis(dataset = SL_2000_2010,
                            category_n = "Ap", category_m = "SG")

# it returns a list with 6 objects
names(testSL)

# showing the objects from the intensity analysis for our illustrative case ------
testSL

# Interval Level -----------
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
chordDiagramLand(dataset = SL_2000_2010$lulc_Onestep,
                 legendtable = SL_2000_2010$tb_legend)

# Sankey Multi Step

sankeyLand(dataset = SL_2000_2010$lulc_Multistep,
           legendtable = SL_2000_2010$tb_legend)


# Um gráfico de barras Evolution

barplotLand(dataset = SL_2000_2010$lulc_Multistep, 
            legendtable = SL_2000_2010$tb_legend,
            xlab = "Year",
            ylab = bquote("Area (" ~ km^2~ ")"),
            area_km2 = TRUE)



intensityAnalysis(SL_2000_2010,category_n =01 , category_m = 6, area_km2 = TRUE)


netgrossplot(dataset = SL_2000_2010$lulc_Multistep,
             legendtable = SL_2000_2010$tb_legend,
             title = NULL,
             xlab = "LUC Category",
             changes = c(GC = "Gross changes", NG = "Net Gain", NL = "Net Loss"),
             color = c(GC = "gray70", NG = "#006400", NL = "#EE2C2C"))




## S4 method for signature 'Interval,ANY'
plot(x, y, ...)



plot(
  x,
  y,
  labels = c(leftlabel = "Interval Change Area (percent of map)", rightlabel =
               "Annual Change Area (percent of map)"),
  title = NA,
  labs = c(type = "Changes", ur = "Uniform Intensity"),
  marginplot = c(lh = -10, rh = 0),
  leg_curv = c(x = 0.1, y = 0.1),
  color_bar = c(fast = "#B22222", slow = "#006400", area = "gray40"),
  fontsize_ui = 10,
  ...
)


## S4 method for signature 'Category,ANY'
plot(
  x,
  y,
  labels = c(leftlabel = "Annual Change Area (km2 or pixels)", rightlabel =
               "Annual Change Intensity (percent of category)"),
  title = NA,
  labs = c(type = "Categories", ur = "Uniform Intensity"),
  marginplot = c(lh = 0.5, rh = 0.5),
  leg_curv = c(x = 0.1, y = 0.1),
  fontsize_ui = 10,
  ...
)



#SL_2000_2010 <-contingenceTable(input_raster = SL_2000_2010,pixelresolution
#                                 = 200))


summary_map(SL_2000_2010[[1]])


summary_dir


#summary_map()

testacc <- acc_changes(SL_2000_2010)


uso<-stack(uso_2000, uso_2010, uso_2018)
uso


