%Function that computes the Fourier spetrum from a given sequence
%Input: DNASignal= DNASignal for which the power spectrum is requiered
%       SignalLenght = Maximun length for the FFT computation (if not given
%                      (it will compute the next power of 2 form the
%                      signal lengt.. pending...)
%                     Options are:
%Output: DNAFourierPowerSpectrum= The power spectrum for the signal
%
%Department of Computer Science
%Universidad de Guadalajara 
%Guadalajara, Jalisco, M?xico
%OCT-2014



function DNAFourierPowerSpectrum=computePowerSpectraFromDNASignal(DNASignal,SignalLenght)
NFFT = 2^nextpow2(SignalLenght);
DNAFourierTransform=fft(DNASignal,NFFT);
NumberOfVectors=size(DNASignal,2);

for i=1:NumberOfVectors
    DNAFourierPowerSpectrum(:,i)=abs(DNAFourierTransform(1:NFFT/2+1,i)); 
end





