function [ fastaContent ] = inputFasta()
%funkcja pobieraj�ca od u�ytkownika identyfikator, opis i sekwencj�
%oraz zwracaj�ca zmienn� fastaContent, zawieraj�c� powy�sze dane
%w formie tekstu z pliku fasta

fastaContent =['>', input('identifier: ','s')...
    char(10), input('sequence: ','s')];


end

