clear

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


load('a2v_16.mat')

% similarity = similarity-repmat(min(similarity')',1,20);

s=sum(similarity,2);
n=repmat(s,1,20);
norm_similarity=similarity./n;

%%
diff_similarity=similarity.*similarity;
diff_similarity=diff_similarity.*diff_similarity;
diff_similarity=diff_similarity.*diff_similarity;
% diff_similarity=diff_similarity.*diff_similarity;
% diff_similarity=diff_similarity.*diff_similarity;
% diff_similarity=diff_similarity.*sqrt(diff_similarity);
s=sum(diff_similarity,2);
n=repmat(s,1,20);
norm_diff_similarity=diff_similarity./n;
imshow(norm_diff_similarity*2,'InitialMagnification',1000)
%%
'R'
aa_dist_similarity('R','H',N_BLOSUM)
aa_dist_similarity('R','K',N_BLOSUM)
aa_dist_similarity('R','A',N_BLOSUM)
aa_dist_similarity('R','H',norm_similarity)
aa_dist_similarity('R','K',norm_similarity)
aa_dist_similarity('R','A',norm_similarity)


%%
'A'
aa_dist_similarity('A','F',N_BLOSUM)
aa_dist_similarity('A','W',N_BLOSUM)
aa_dist_similarity('A','S',N_BLOSUM)
aa_dist_similarity('A','F',norm_similarity)
aa_dist_similarity('A','W',norm_similarity)
aa_dist_similarity('A','S',norm_similarity)

%%
'S'
aa_dist_similarity('S','N',N_BLOSUM)
aa_dist_similarity('S','Q',N_BLOSUM)
aa_dist_similarity('S','Y',N_BLOSUM)
aa_dist_similarity('S','N',norm_similarity)
aa_dist_similarity('S','Q',norm_similarity)
aa_dist_similarity('S','Y',norm_similarity)


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
AAs={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};

X=double(scores(:,1:3))*10;
x=X(:,1);
y=X(:,1);
z=X(:,1);
figure()
scatter3(x,y,z);
dx = 0.1; dy = 0.1; dz = 0.1;
text(x+dx, y+dy,z+dz, AAs);

%%
af=vector(aa_idx('A'),:)-vector(aa_idx('F'),:);
aw=vector(aa_idx('A'),:)-vector(aa_idx('W'),:);
pdist([af;aw],'cosine')

%%
as=vector(aa_idx('A'),:)-vector(aa_idx('S'),:);
af*as'

%%
nq=vector(aa_idx('N'),:)-vector(aa_idx('Q'),:);
de=vector(aa_idx('D'),:)-vector(aa_idx('E'),:);
pdist([nq;de],'cosine')
%%
t_count = 0;
a_count = 0;

for a = 1:20
    for b = 1:20
        for c = 1:20
            for d = 1:20
                bd=((N_BLOSUM(a,b)-N_BLOSUM(c,d))>0);
                sd=((norm_similarity(a,b)-norm_similarity(c,d))>0);
                if bd==sd
                    a_count = a_count + 1;
                end
                t_count = t_count + 1;
            end
        end
    end
end
agree_rate = a_count/t_count
