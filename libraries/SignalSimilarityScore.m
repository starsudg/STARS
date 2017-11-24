%Function that computes the similarity/difference between two signals
%By comparing their Fourier spectrum magnitude
%Input: DNASignal1 and DNASignal2= the signals to be compared
%       SimilarityMetric = Method for simmilarity/distance measurement

%                           %Fourier spectrum magnitude space
%                                   -Distances-
%                               1 - Norm L2 distance
%                               2 - Sorensen distance
%                               3 - Bhattacharyya Distance
%                               4 - Gower Distance
%                               5 - Lorentzian Distance
%                               6 - kullbackLeibler Distance
%                                   -Similarities-
%                               7 - Cosine Similarity
%                               8 - Dice Distance
%                               9 - Fidelity Distance
%                               10 - innerProduct Similarity
%                               11 - Intersection Distance
%                               12 - Jaccard Distance
%                               13 - Correlation Similarity
%
%
%
%Output: Score= The similarty/distance score
%
%Department of Computer Science
%Universidad de Guadalajara, Guadalajara, Jalisco, M?xico
%Jun-2015

%Outputs Offsets and Menas are for experimentations and can be removed
function [ScoreFinal,OffsetDif,MeansDif]=SignalSimilarityScore(DNASignal1, DNASignal2, Metric,NormalizeSignals,RemoveOffset)

OffsetDif=0;
MeansDif=0;
    
    %We use the maximum of the two sequence's lengths
    %SignalLenght=1320;%max(size(DNASignal1,1),size(DNASignal2,1));
    %We compute the Magnitue of the Fourier Spectrum
    %DNASignal1=computePowerSpectraFromDNASignal(DNASignal1,SignalLenght);
    %DNASignal2=computePowerSpectraFromDNASignal(DNASignal2,SignalLenght);

       
    if (RemoveOffset==1)
        %Remove Offset
        OffsetDif=abs(DNASignal1(1,1)-DNASignal2(1,1));
        DNASignal1=DNASignal1(2:end,:);
        DNASignal2=DNASignal2(2:end,:);
        
        %DNASignal1 = DNASignal1(:,1) - mean(DNASignal1(:,1));
        %DNASignal2 = DNASignal2(:,1) - mean(DNASignal2(:,1));
    end
    
    if (NormalizeSignals==1)
        %Normalize the signals
        DNASignal1Temp = [];
        DNASignal2Temp = [];
        for i = DNASignal1
            DNASignal1Temp = [DNASignal1Temp , i/max(i)];
        end
        for i = DNASignal2
            DNASignal2Temp = [DNASignal2Temp , i/max(i)];
        end
        DNASignal1=DNASignal1Temp;
        DNASignal2=DNASignal2Temp;
        %size(DNASignal1)
        %size(DNASignal2)
        
        
    end
    
    MeansDif=abs(mean(DNASignal1(:,1))-mean(DNASignal2(:,1)));
    
    ScoreFinal =0;
    for i=1:size(DNASignal1,2)
        switch Metric
            case 'sqEuclidean'
                Distance = NormL2(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Manhatan'
                Distance = Manhatan(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'NormalizedEuclidean'
                Distance = NormalizedEuclidean(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Sorensen'
                Distance = Sorensen(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Bhattacharyya'
                Distance=BhattacharyyaDistance(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Gower'
                Distance=GowerDistance(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Lorentzian'
                Distance=LorentzianDistance(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'kullbackLeibler'
                Distance = kullbackLeibler(DNASignal1(:,i),DNASignal2(:,i));
                Score=Distance;
            case 'Cosine'
                Similarity=CosineSimilarity(DNASignal1(:,i),DNASignal2(:,i));
                Score=Similarity;
            case 'Dice'
                Similarity=DiceSimilarity(DNASignal1(:,i),DNASignal2(:,i));
                Score=Similarity;
            case 'Fidelity'
                similarity = fidelity(DNASignal1(:,i),DNASignal2(:,i));
                Score=similarity;
            case 'innerProduct'
                Similarity = innerProduct(DNASignal1(:,i),DNASignal2(:,i));
                Score=Similarity;
            case 'Intersection'
                similarity = intersection(DNASignal1(:,i),DNASignal2(:,i));
                Score=similarity;
            case 'Jaccard'
                Similarity=JaccardSimilarity(DNASignal1(:,i),DNASignal2(:,i));
                Score=Similarity;
            case 'Correlation'
                similarity = corrcoef(DNASignal1(:,i),DNASignal2(:,i));
                Score = similarity(1,2);
        end
        ScoreFinal=ScoreFinal+Score;
    end
    ScoreFinal=ScoreFinal/size(DNASignal1,2);
end