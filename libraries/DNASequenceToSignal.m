%Function that maps a character DNA sequence into a signal using one of the
%mappings existing in the literature
%Input: DNAsequence= DNAsequence string
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
%OCT-2014

function DNASignal=DNASequenceToSignal(DNASequence,MappingType)
%get the sequence lenght
DNASequenceLenght=length(DNASequence);
%Initialize the array for the DNASignal
switch MappingType
    case 'Voss'
        DNASignal=zeros(DNASequenceLenght,4);
    case 'Tetrahedron'
        DNASignal=zeros(DNASequenceLenght,3);
    case 'Integer'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'Real'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'Complex'
        DNASignal=zeros(DNASequenceLenght,2);
    case 'Quaternion'
        DNASignal=zeros(DNASequenceLenght,3);
    case 'ElectronIon'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'AtomicNumber'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'PairedNumeric'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'DNAWalk'
        DNASignal=zeros(DNASequenceLenght,1);
    case 'ZCurve'
        DNASignal=zeros(DNASequenceLenght,3);
    otherwise
        error('Wrong mapping option (avaliable 1 to 11)');
end

%Change each of the DNA sequences characters according to the selected
%transform

for i=1:DNASequenceLenght
    switch DNASequence(i)
        case 'a'
            DNASequence(i)='A';
        case 't'
            DNASequence(i)='T';
        case 'c'
            DNASequence(i)='C';
        case 'g'
            DNASequence(i)='G';
    end
            
            
    
    switch MappingType
    case 'Voss'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=1;
                DNASignal(i,2)=0;
                DNASignal(i,3)=0;
                DNASignal(i,4)=0;
            case 'G'
                DNASignal(i,1)=0;
                DNASignal(i,2)=1;
                DNASignal(i,3)=0;
                DNASignal(i,4)=0;
            case 'A'
                DNASignal(i,1)=0;
                DNASignal(i,2)=0;
                DNASignal(i,3)=1;
                DNASignal(i,4)=0;
            case 'T'
                DNASignal(i,1)=0;
                DNASignal(i,2)=0;
                DNASignal(i,3)=0;
                DNASignal(i,4)=1;
            case 'U'
                DNASignal(i,1)=0;
                DNASignal(i,2)=0;
                DNASignal(i,3)=0;
                DNASignal(i,4)=1;
            case 'R'
                DNASignal(i,1)=0;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;
                DNASignal(i,4)=0;
            case 'Y'
                DNASignal(i,1)=1;
                DNASignal(i,2)=0;
                DNASignal(i,3)=0;
                DNASignal(i,4)=1;
            case 'K'
                DNASignal(i,1)=0;
                DNASignal(i,2)=1;
                DNASignal(i,3)=0;
                DNASignal(i,4)=1;
            case 'M'
                DNASignal(i,1)=1;
                DNASignal(i,2)=0;
                DNASignal(i,3)=1;
                DNASignal(i,4)=0;
            case 'S'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=0;
                DNASignal(i,4)=0;
            case 'W'
                DNASignal(i,1)=0;
                DNASignal(i,2)=0;
                DNASignal(i,3)=1;
                DNASignal(i,4)=1;
            case 'B'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=0;
                DNASignal(i,4)=1;
            case 'D'
                DNASignal(i,1)=0;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;
                DNASignal(i,4)=1;
            case 'H'
                DNASignal(i,1)=1;
                DNASignal(i,2)=0;
                DNASignal(i,3)=1;
                DNASignal(i,4)=1;
            case 'V'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;
                DNASignal(i,4)=0;
            case 'N'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;
                DNASignal(i,4)=1;
            case 'X'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;
                DNASignal(i,4)=1;

        end
        
    case 'Tetrahedron'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=-1*sqrt(2)/3;
                DNASignal(i,2)=1*sqrt(6)/3;
                DNASignal(i,3)=-1/3;
            case 'G'
                DNASignal(i,1)=-1*sqrt(2)/3;
                DNASignal(i,2)=-1*sqrt(6)/3;
                DNASignal(i,3)=-1/3;
            case 'A'
                DNASignal(i,1)=0*sqrt(2)/3;
                DNASignal(i,2)=0*sqrt(6)/3;
                DNASignal(i,3)=3/3;
            case 'T'
                DNASignal(i,1)=2*sqrt(2)/3;
                DNASignal(i,2)=0*sqrt(6)/3;
                DNASignal(i,3)=-1/3;
        end      
         
    case 'Integer'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=1;
            case 'G'
                DNASignal(i,1)=3;
            case 'A'
                DNASignal(i,1)=2;
            case 'T'
                DNASignal(i,1)=0;
        end  
    case 'Real'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=0.5;
            case 'G'
                DNASignal(i,1)=-0.5;
            case 'A'
                DNASignal(i,1)=-1.5;
            case 'T'
                DNASignal(i,1)=1.5;
        end  
    case 'Complex'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=-1;
                DNASignal(i,2)=1;
            case 'G'
                DNASignal(i,1)=-1;
                DNASignal(i,2)=-1;
            case 'A'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
            case 'T'
                DNASignal(i,1)=1;
                DNASignal(i,2)=-1;
        end  
    case 'Quaternion'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=1;
                DNASignal(i,2)=-1;
                DNASignal(i,3)=-1;
            case 'G'
                DNASignal(i,1)=-1;
                DNASignal(i,2)=-1;
                DNASignal(i,3)=1;                
            case 'A'
                DNASignal(i,1)=1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=1;                
            case 'T'
                DNASignal(i,1)=-1;
                DNASignal(i,2)=1;
                DNASignal(i,3)=-1;                
        end  
    case 'ElectronIon'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=0.1340;
            case 'G'
                DNASignal(i,1)=0.0806;
            case 'A'
                DNASignal(i,1)=0.1260;
            case 'T'
                DNASignal(i,1)=0.1335;
        end 
    case 'AtomicNumber'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=58;
            case 'G'
                DNASignal(i,1)=78;
            case 'A'
                DNASignal(i,1)=70;
            case 'T'
                DNASignal(i,1)=66;
        end 
    case 'PairedNumeric'
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=-1;
            case 'G'
                DNASignal(i,1)=-1;
            case 'A'
                DNASignal(i,1)=1;
            case 'T'
                DNASignal(i,1)=1;
        end       
    case 'DNAWalk'
        if (i>1)
            PreviousValue=DNASignal(i-1,1);
        else
            PreviousValue=0;
        end
        switch DNASequence(i)
            case 'C'
                DNASignal(i,1)=PreviousValue+1;
            case 'G'
                DNASignal(i,1)=PreviousValue-1;
            case 'A'
                DNASignal(i,1)=PreviousValue-1;
            case 'T'
                DNASignal(i,1)=PreviousValue+1;
        end 
    case 'ZCurve'
		%considering the previous value
		if (i>1)
			PreviousValue1=DNASignal(i-1,1);
			PreviousValue2=DNASignal(i-1,2);
			PreviousValue3=DNASignal(i-1,3);
		else
			PreviousValue1=0;
			PreviousValue2=0;
			PreviousValue3=0;
		end
        switch DNASequence(i)
            case 'C'
                %DNASignal(i,1)=-1;
                %DNASignal(i,2)=1;
                %DNASignal(i,3)=-1;
                DNASignal(i,1)=PreviousValue1-1;
                DNASignal(i,2)=PreviousValue2+1;
                DNASignal(i,3)=PreviousValue3-1;				
            case 'G'
                %DNASignal(i,1)=0;
                %DNASignal(i,2)=0;
                %DNASignal(i,3)=-2;                
                DNASignal(i,1)=PreviousValue1+1;
                DNASignal(i,2)=PreviousValue2-1;
                DNASignal(i,3)=PreviousValue3-1;				
            case 'A'
                %DNASignal(i,1)=1;
                %DNASignal(i,2)=1;
                %DNASignal(i,3)=-1;       
                DNASignal(i,1)=PreviousValue1+1;
                DNASignal(i,2)=PreviousValue2+1;
                DNASignal(i,3)=PreviousValue3+1;								
            case 'T'
                %DNASignal(i,1)=0;
                %DNASignal(i,2)=0;
                %DNASignal(i,3)=0;    
                DNASignal(i,1)=PreviousValue1-1;
                DNASignal(i,2)=PreviousValue2-1;
                DNASignal(i,3)=PreviousValue3+1;								
        end  
    otherwise
        error('Wrong mapping option (avaliable 1 to 11)');
    end    
end

%Traspose the signal
%DNASignal=DNASignal';
