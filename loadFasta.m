function [ FastaSet ] = loadFasta( method,varargin )
%funkcja przyjmuj�ca jako argument nazw� metody (manual/file/ncbi 
%oraz �r�d�o (w przypadku metody file - nazw� pliku fasta, w przypadku
%metody ncbi identyfikator sekwencji z bazy nukleotyd�w) i zwracaj�ca
%tablic� char�w przetworzon� za pomoc� funkcji parseFasta


if strcmp(method,'manual')
    fastaContent = inputFasta;
elseif strcmp(method,'file')
    fastaContent = fetchFasta(varargin{1});
elseif strcmp(method,'ncbi')
    fastaContent = fetchNCBI(varargin{1});
end


FastaSet = parseFasta(fastaContent);


end
    
