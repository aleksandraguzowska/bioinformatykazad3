function [ fastaContent ] = fetchNCBI( identifier )
%funkcja pobieraj�ca plik fasta o danym identyfikatorze sekwencji
%za pomoc� narz�dzia ncbi entrez utilities 
%i umieszczaj�ca jego tre�� w zwracanej zmiennej fastaContent

URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = webread(URL, 'db','nucleotide',...
                            'rettype','fasta',...
                            'id',identifier);

                        
end
