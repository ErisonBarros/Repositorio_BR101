## Modelo Seguido https://github.com/simonmoulds/lulcc

library(lulcc)
install.packages("randomForest")
#> Loading required package: raster
#> Loading required package: sp
data(pie)
obs <- ObsLulcRasterStack(x=pie,
                          pattern="lu",
                          categories=c(1,2,3),
                          labels=c("Forest","Built","Other"),
                          t=c(0,6,14))

crossTabulate(obs, times=c(0,6))

ef <- ExpVarRasterList(x=pie, pattern="ef")        

## 2. Probability surface modelling

part <- partition(x=obs[[1]],
                  size=0.1, spatial=TRUE)

# extract training data
train.data <- getPredictiveModelInputData(obs=obs,
                                          ef=ef,
                                          cells=part[["train"]],
                                          t=0)

test.data <- getPredictiveModelInputData(obs=obs,
                                         ef=ef,
                                         cells=part[["test"]])

     # Modelos
# fit models (note that a predictive model is required for each land use category)
forms <- list(Built~ef_001+ef_002+ef_003,
              Forest~ef_001+ef_002,
              Other~ef_001+ef_002)

# generalized linear model models
glm.models <- glmModels(formula=forms,
                        family=binomial,
                        data=train.data,
                        obs=obs)
#> Warning in if (is.na(categories) | is.na(labels)) {: the condition has length >
#> 1 and only the first element will be used
#> Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
# recursive partitioning and regression tree models
rpart.models <- rpartModels(formula=forms,
                            data=train.data,
                            obs=obs)
#> Warning in if (is.na(categories) | is.na(labels)) {: the condition has length >
#> 1 and only the first element will be used
# random forest models (WARNING: takes a long time!)
rf.models <- randomForestModels(formula=forms,
                                data=train.data,
                                obs=obs)
#> Warning in if (is.na(categories) | is.na(labels)) {: the condition has length >
#> 1 and only the first element will be used
#> Warning in randomForest.default(m, y, ...): The response has five or fewer
#> unique values. Are you sure you want to do regression?

#> Warning in randomForest.default(m, y, ...): The response has five or fewer
#> unique values. Are you sure you want to do regression?

#> Warning in randomForest.default(m, y, ...): The response has five or fewer
#> unique values. Are you sure you want to do regression?   


all.data <- as.data.frame(x=ef, obs=obs, cells=part[["all"]])

# GLM
probmaps <- predict(object=glm.models,
                    newdata=all.data,
                    data.frame=TRUE)
points <- rasterToPoints(obs[[1]], spatial=TRUE)
probmaps <- SpatialPointsDataFrame(points, probmaps)
probmaps <- rasterize(x=probmaps, y=obs[[1]],
                      field=names(probmaps))
rasterVis::levelplot(probmaps)

glm.pred <- PredictionList(models=glm.models,
                           newdata=test.data)
glm.perf <- PerformanceList(pred=glm.pred,
                            measure="rch")
rpart.pred <- PredictionList(models=rpart.models,
                             newdata=test.data)
rpart.perf <- PerformanceList(pred=rpart.pred,
                              measure="rch")
rf.pred <- PredictionList(models=rf.models,   #### <=== ProblemAS AQUI
                          newdata=test.data)
rf.perf <- PerformanceList(pred=rf.pred,
                           measure="rch")
plot(list(glm=glm.perf,
          rpart=rpart.perf,
          rf=rf.perf))


parte  <- rasterToPoints ( obs [[ 1 ]],
                           diversão = função ( x ) x  ! =  2 ,
                           espacial = TRUE )
test.data <- getPredictiveModelInputData ( obs = obs ,
                                           ef = ef ,
                                           células = parte ,
                                           t = 6 )
glm.pred <- PredictionList ( modelos = glm.models [[ 2 ]],
                             newdata = test.data )
glm.perf  <- PerformanceList ( pred = glm.pred ,
                               medida = " RCH " ) 
parcela ( lista ( GLM = glm.perf ) )

