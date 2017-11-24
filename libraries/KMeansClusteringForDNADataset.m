%Perform K-Mean Clustering on a dataset of DNA sequences
%Input:
%       DNADataset= A cell array with all the DNA character sequences to
%                   process
%       DatasetNames: A cell array with the same number of elements than
%                   DNADataset variable with the names of each DNASequence
%       NumberOfClusters: Number of cluster to perform K-means
%       SequenceGruops: A cell array with the same number of elements than
%                   DNADataset variable with the know group for each sequence
%       MARKER_VECTOR: A cell array with the marker to be used for each
%                   possible group
%       fileName: A string with the fasta file name with the DNASequences
%       to be processed.
%
%
%
%Output:
%   -A plot for all clusters that depicts the name of the sequences in the
%   clusters and their distance to its cluster-centroid and distance of each
%   centroid to main centroid
%   -Matrix of centroids distances
%
%
%Department of Computer Science
%University of Guadalajara, Guadalajara, Jalisco, Mexico
%Last Modified by Sulema Torres and Ricardo Salido, v3 15-sep-2017

function KMeansClusteringForDNADataset(DNADataset,DatasetNames,SequenceGroups,NumberOfClusters,MARKER_VECTOR,fileName)

typeOfTransformation='Voss';
Distance='sqEuclidean';
NumberOfReplicates=100;
DistanceOffset=3;

%using Voss transformation
tic
disp('Mapping DNA sequence to signal...');
DNAFourierPowerSpectrum=generateFourierSpectrumsFromDNADataset(DNADataset,typeOfTransformation);

for i=1:numel(DNADataset)
    AllFeatures(i,:)=DNAFourierPowerSpectrum{i}(:);
end
disp('Mapping done');
toc 
disp('Runing K-means algorithm...');
%Perform k-means
opts = statset('Display','final');
[idx,ctrs,sumd,D] = kmeans(AllFeatures,NumberOfClusters,...
    'Distance',Distance,...
    'Replicates',NumberOfReplicates,...
    'Options',opts);
disp ('K-means done');
toc
disp('Ploting centroid-distances matrix..');
%Get CentroidMatrix
clear valnorm1
valnorm1=[];
for nk = 1:size(ctrs,1)
    for mk = 1:size(ctrs,1)
        if(nk<=mk)
            valnorm1(nk,mk)=norm(ctrs(nk,:)-ctrs(mk,:));
        end
    end
end
ClusterCentroidMatrix=valnorm1;

%plot CentroidMatrix
titleTxt=sprintf('CentroidMatrix File-%s K-%d',fileName,NumberOfClusters);
figure('name',titleTxt,'color',[1 1 1]),imagesc(ClusterCentroidMatrix);
colorbar;
ticklabel={''};
tick=[0.25];
for i=1:NumberOfClusters
    ticklabel=horzcat(ticklabel,strcat('C',num2str(i)));
    ticklabel=horzcat(ticklabel,{''});
    tick=horzcat(tick,i,i+0.25);
end

set(gca,'YTickLabel',ticklabel,...
    'YTick',tick,...
    'YDir','reverse',...
    'XTickLabel',ticklabel,...
    'XTick',tick,...
    'XAxisLocation','top',...
    'Layer','top',...
    'Ticklength',[0 0]);
disp('Ploting matrix done');

disp('Ploting generated clusters...')
%Plot clusters
ctrs_draw=ctrs./max(max(ctrs));
D_draw=D./max(max(D));
sumd_draw=sumd./max(max(sumd));

%Get the Centroid of all centroids
MainCentroid=mean(ctrs);
MainCentroid_draw=mean(ctrs_draw);

for k=1:NumberOfClusters
    DistancesToMainCentroid_draw(k)=sqrt(sum((ctrs_draw(k,:)-MainCentroid_draw).^2));
    DistancesToMainCentroid(k)=sqrt(sum((ctrs(k,:)-MainCentroid).^2));
end

[SortedDistanceToMainCentroid, sortedMainClusterIdx]=sort(DistancesToMainCentroid);
[SortedDistanceToMainCentroid_draw, sortedMainClusterIdx_draw]=sort(DistancesToMainCentroid_draw);
AngularIncrementMainClusters=2*pi/NumberOfClusters;
AnglesInThePlotMainClusters=pi/4:AngularIncrementMainClusters:(2*pi+(pi/4))-AngularIncrementMainClusters;


DistancesToNextCentroid(1)=0;
for k=1:NumberOfClusters-1
    DistancesToNextCentroid(k+1)=sqrt(sum((ctrs(sortedMainClusterIdx_draw(k),:)'-ctrs(sortedMainClusterIdx_draw(k+1),:)').^2));
end


titleTxt=sprintf('Clustering File-%s K-%d',fileName,NumberOfClusters);
figure('name',titleTxt,'color',[1 1 1]);
hold on
scatter(0,0,100,[0 0 0],'fill');


%Plot the resulting classification
for k=1:NumberOfClusters
    XMC_draw=(SortedDistanceToMainCentroid_draw(k)+DistanceOffset)*cos(AnglesInThePlotMainClusters(k));
    YMC_draw=(SortedDistanceToMainCentroid_draw(k)+DistanceOffset)*sin(AnglesInThePlotMainClusters(k));
    scatter(XMC_draw,YMC_draw);
    line([0 XMC_draw],[0 YMC_draw],'LineStyle',':','LineWidth',1,'Color',[.5 .5 .5]);
    text((XMC_draw/2),(YMC_draw/2),num2str(SortedDistanceToMainCentroid(k),3),'FontSize',10);
    text((XMC_draw/2),(YMC_draw/2+0.3),strcat('C-',num2str(sortedMainClusterIdx_draw(k),3)),'FontSize',10);
    
    %Get the elements belonging to cluster K
    InThisCluster=find(idx==sortedMainClusterIdx_draw(k));
    
    AngularIncrement=2*pi/numel(InThisCluster);
    AnglesInThePlot=pi/4:AngularIncrement:(2*pi+(pi/4))-AngularIncrement;
    textoffset_draw=  (sumd_draw(1)*.005);
    
    drawnow;
        
    if (numel(InThisCluster)==1)
        scatter(XMC_draw,YMC_draw,100,'b',MARKER_VECTOR(str2num(SequenceGroups{1,sortedAbsoluteIdx(z)})),'LineWidth',2);
        scatter(XMC_draw,YMC_draw,100,'b','*','LineWidth',2);
        text(XMC_draw,YMC_draw,DatasetNames(InThisCluster(1)),'FontSize',10);
    else
        DistancesToCentroid=D(InThisCluster,k);
        DistancesToCentroid_draw=D_draw(InThisCluster,k);
        [SortedDistanceToCentroid, sortedIdx]=sort(DistancesToCentroid);
        [SortedDistanceToCentroid_draw, sortedIdx]=sort(DistancesToCentroid_draw);
        sortedAbsoluteIdx=InThisCluster(sortedIdx);
        for z=1:numel(InThisCluster)
            X_draw=(SortedDistanceToCentroid_draw(z))*cos(AnglesInThePlot(z)+(pi/8))+XMC_draw;
            Y_draw=(SortedDistanceToCentroid_draw(z))*sin(AnglesInThePlot(z)+(pi/8))+YMC_draw;
            scatter(X_draw,Y_draw,180,'b',MARKER_VECTOR(str2num(SequenceGroups{1,sortedAbsoluteIdx(z)})),'LineWidth',2);
            line([XMC_draw X_draw],[YMC_draw Y_draw],'LineStyle','--','LineWidth',1);
            text(X_draw+(textoffset_draw),Y_draw,DatasetNames(sortedAbsoluteIdx(z)),'FontSize',10)
            text(XMC_draw+((X_draw-XMC_draw)/2),YMC_draw+((Y_draw-YMC_draw)/2),num2str(SortedDistanceToCentroid(z),3),'FontSize',10);
        end
        scatter(XMC_draw,YMC_draw,100,[0 0 0],'fill');
    end
    axis off
    
    %plot legend with markers
    if length(MARKER_VECTOR)~=1
        h = zeros(length(MARKER_VECTOR), 1);
        c={};
        for i=1:length(MARKER_VECTOR)
            h(i) = plot(NaN,NaN,strcat('b',MARKER_VECTOR(i)));
            c=horzcat(c,strcat('Group',{' '}, num2str(i)));
        end
        legend(h, c);
    end
end
disp('Ploting clusters done');