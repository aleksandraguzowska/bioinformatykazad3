function [ FastaSet ] = parseFasta( fastaContent )
%funkcja przyjmuj�ca jako argument tekst z pliku fasta 
%i zwracaj�ca tablic� char�w z identyfikatorem sekwencji i sekwencj�

%identyfikator sekwencji
id = sscanf(fastaContent,strcat('>','%s'));

%sekwencja
expression= '\n.+';
sequence = regexp(fastaContent,expression,'match');
sequence = regexprep(sequence,'\n','');

FastaSet = [id sequence];

end

