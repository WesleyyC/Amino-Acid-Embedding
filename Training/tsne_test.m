%% load data

clear
load('a2v_context.mat')
train_X = vector;

%% run model

mappedX = tsne(train_X);

%% 3D model
% AAs={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};
% dx = 10; dy = 10; dz=10;
% figure()
% scatter3(mappedX(:,1), mappedX(:,2), mappedX(:,3));
% text(mappedX(:,1)+dx, mappedX(:,2)+dy,mappedX(:,3)+dz, AAs);

%% 2D model

idx = 1:200;

AAs=dict(idx,2);
dx = 0.1; dy = 0.1;
figure()
scatter(mappedX(idx,1), mappedX(idx,2));
text(mappedX(idx,1)+dx, mappedX(idx,2)+dy, AAs);