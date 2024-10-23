% ML model tryouts
% k nearest neighbours models
% train and test data
dataTrain = data_table_ml_train; % 80% data k train koraisi ,, 20% k test data rakhlam
dataTest = data_table_ml_test;

%creating 5 fold validation partition
%part = cvpartition(dataTrain.beat_type_2,"KFold",5);

%using knn model

mdlknn = fitcknn(dataTrain,"beat_type_2","NumNeighbors",1,"Standardize",true,"Distance","mahalanobis","DistanceWeight","equal");



%view(mdlknn,"mode","graph")
%predicting

pred = predict(mdlknn,dataTest);
confusionchart(dataTest.beat_type_2,pred)

%mistake rate 
cm = confusionmat(dataTest.beat_type_2,pred);
% Split into correct and incorrect classifications
yes = diag(cm);
no = cm - diag(yes);
mistakeRate = sum(no,2)./sum(cm,2)