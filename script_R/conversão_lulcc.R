install.packages("lulcc")
library("lulcc")

# Montagem da Estrututra do Arquivos

diretorio <- "D:/onedrive/UFPE/DOUTORADO/RSTUDIO/BR_408/DATASET_BR408/v2_Variaveis_TIFF/v2_Variaveis_TIFF"
arquivos<- list.files(diretorio,
                      full.names = TRUE,
                      pattern = ".tif$")

# Read in the land use files and change the variables to factors.
nlcd.2000<-raster(arquivos[2])

# # Para evitar projetar o modelo sobre toda a caixa delimitadora,
#mascare as áreas fora do intervalo das categorias. As categorias de uso da terra
#variam de 10 a 90, portanto, nada acima de 100 deve ser exibido.

nlcd.2000 <- mask(nlcd.2000, nlcd.2000<100)

# Create a raster attribute table (RAT) with the `ratify` function.
nlcd.2000<- ratify(nlcd.2000)

# Modify the RAT with the labels
l <- levels(nlcd.2000)[[1]]
l$code <- c("ocorr.2000","ocorr.2010","ocorr.2018","Agricultural.1992","Wetland.1992")

# Assign the modified RAT to the raster with the levels function.
levels(nlcd.1992) <- l

## load data
data(pie)
## observed maps
obs <- ObsLulcRasterStack(raster_arq[[1:4]],
                          pattern="lu",
                          categories=c(1,2,3),
                          labels=c("Forest","Built","Other"),
                          t=c(2000,2010,2018))

obs
### analise das observações
plot(obs)
summary(obs)
show(obs)


crossTabulate(obs, times=c(0,14))
## explanatory variables
ef <- ExpVarRasterList(x=pie, pattern="ef")
ef
part <- partition(x=obs[[1]], size=0.1, spatial=TRUE)
train.data <- getPredictiveModelInputData(obs=obs, ef=ef, cells=part[["train"]])
