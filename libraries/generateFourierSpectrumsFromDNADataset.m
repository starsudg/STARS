%Generate Fourier Spectrums for a set of DNA sequences in a cell array
%using the selected transform
%Input: DNASequences= A cell array with all the DNA character sequences to
%       process
%       MappingType = Type of DNASequence to Numeric representation mapping
%                     Options are:
%                               1 - Voss Representation [1]
%                               2 - Tetrahedron representation [2]
%                               3 - Integer representation [3]
%                               4 - Real representation [4]
%                               5 - Complex representation [5]
%                               6 - Quaternion representation [6]
%                               7 - Electron-ion interaction potentials [7]
%                               8 - Atomic Number [8]
%                               9 - Paired Numeric [9]
%                               10 - DNA Walk [10]
%                               11 - Z-Curve [11]
%Output: DNASignal= The signal representation of the input sequence
%
%Department of Computer Science
%Universidad de Guadalajara, Guadalajara, Jalisco, México
%AUG-2015

function DNAFourierPowerSpectrum=generateFourierSpectrumsFromDNADataset(DNASequences,MappingType)

%Mapp all the DNASequences
maxlength=0;
for i=1:numel(DNASequences)
    DNASignal{i}=DNASequenceToSignal(DNASequences{i},MappingType);
    maxlength=max(maxlength,length(DNASignal{i}));
end
    
for i=1:numel(DNASequences)
    %Compute the Fourier Spectrum of every DNASignals
    DNAFourierPowerSpectrum{i}=computePowerSpectraFromDNASignal(DNASignal{i},maxlength);
end


