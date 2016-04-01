% load data

clear

AAs={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};

BLOSUM_Sigma = 2;
C=[9,-1,-1,-3,0,-3,-3,-3,-4,-3,-3,-3,-3,-1,-1,-1,-1,-2,-2,-2];
S=[-1,4,1,-1,1,0,1,0,0,0,-1,-1,0,-1,-2,-2,-2,-2,-2,-3];
T=[-1,1,4,1,-1,1,0,1,0,0,0,-1,0,-1,-2,-2,-2,-2,-2,-3];
P=[-3,-1,1,7,-1,-2,-1,-1,-1,-1,-2,-2,-1,-2,-3,-3,-2,-4,-3,-4];
A=[0,1,-1,-1,4,0,-1,-2,-1,-1,-2,-1,-1,-1,-1,-1,-2,-2,-2,-3];
G=[-3,0,1,-2,0,6,-2,-1,-2,-2,-2,-2,-2,-3,-4,-4,0,-3,-3,-2];
N=[-3,1,0,-2,-2,0,6,1,0,0,-1,0,0,-2,-3,-3,-3,-3,-2,-4];
D=[-3,0,1,-1,-2,-1,1,6,2,0,-1,-2,-1,-3,-3,-4,-3,-3,-3,-4];
E=[-4,0,0,-1,-1,-2,0,2,5,2,0,0,1,-2,-3,-3,-3,-3,-2,-3];
Q=[-3,0,0,-1,-1,-2,0,0,2,5,0,1,1,0,-3,-2,-2,-3,-1,-2];
H=[-3,-1,0,-2,-2,-2,1,1,0,0,8,0,-1,-2,-3,-3,-2,-1,2,-2];
R=[-3,-1,-1,-2,-1,-2,0,-2,0,1,0,5,2,-1,-3,-2,-3,-3,-2,-3];
K=[-3,0,0,-1,-1,-2,0,-1,1,1,-1,2,5,-1,-3,-2,-3,-3,-2,-3];
M=[-1,-1,-1,-2,-1,-3,-2,-3,-2,0,-2,-1,-1,5,1,2,-2,0,-1,-1];
I=[-1,-2,-2,-3,-1,-4,-3,-3,-3,-3,-3,-3,-3,1,4,2,1,0,-1,-3];
L=[-1,-2,-2,-3,-1,-4,-3,-4,-3,-2,-3,-2,-2,2,2,4,3,0,-1,-2];
V=[-1,-2,-2,-2,0,-3,-3,-3,-2,-2,-3,-3,-2,1,3,1,4,-1,-1,-3];
F=[-2,-2,-2,-4,-2,-3,-3,-3,-3,-3,-1,-3,-3,0,0,0,-1,6,3,1];
Y=[-2,-2,-2,-3,-2,-3,-2,-3,-2,-1,2,-2,-2,-1,-1,-1,-1,3,7,2];
W=[-2,-3,-3,-4,-3,-2,-4,-4,-3,-2,-2,-3,-3,-1,-3,-2,-3,1,2,11];
O_BLOSUM=[C',S',T',P',A',G',N',D',E',Q',H',R',K',M',I',L',V',F',Y',W'];
BLOSUM=exp(O_BLOSUM/BLOSUM_Sigma);
s=sum(BLOSUM,2);
n=repmat(s,1,20);
N_BLOSUM=BLOSUM./n;


load('a2v_context_1500.mat')

s=sum(similarity,2);
n=repmat(s,1,8000);
norm_similarity=similarity./n;

%% 
[eigenvectors,scores,variances]  = pca(vector);

num_features=1:length(variances);
percentage=zeros(size(num_features));

for i = 2:length(variances)
    percentage(i) = sum(variances(1:i-1))/sum(variances);
end

figure()
plot(num_features,percentage);

%%
[poccur,pval]=hist(similarity(:),unique(similarity(:)));

%%
singleAA={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};
j = 1;
A_vector = zeros(400,1500);
AAs = cell(400,1);
counter  = 1;
for i = 1:8000
    if dict(i,2)==singleAA{j}
        A_vector(counter,:) = vector(i,:);
        AAs{counter}=dict(i,:);
        counter = counter + 1;
    end
end

%%
train_X = vector;
mappedX = tsne(train_X);

%%
dx = 0; dy = 0;
figure()
scatter(mappedX(:,1), mappedX(:,2));
text(mappedX(:,1)+dx, mappedX(:,2)+dy, dict);

%%
singleAA={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};
color={'c','r','g','b','k'};
marker={'^','s','o','x'};
figure()
for i = 1:8000
    idx=aa_idx(dict(i,2));
    color_idx=floor((idx-1)/4)+1;
    marker_idx=mod((idx-1),4)+1;
    scatter(mappedX(i,1),mappedX(i,2),color{color_idx},marker{marker_idx});
    hold on
end
    
    
    