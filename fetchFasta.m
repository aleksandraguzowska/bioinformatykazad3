function [ fastaContent ] = fetchFasta( filename )
%funkcja otwieraj�ca plik fasta znajduj�cy si� na urz�dzeniu za pomoc� jego
%nazwy i wpisuj�ca jego tre�� do zwracanej zmiennej fastaContent

filename = strcat(filename,'.fasta');
fastaContent = fileread(filename);
                        
end


