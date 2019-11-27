function Blocks=ReadSTRIPS(fileName)

if nargout==0
    global Blocks
end

Temp=struct();

file=fopen(fileName);
tline = fgetl(file);
while ischar(tline)
    eval(tline);
    tline = fgetl(file);
end

fclose(file);
Blocks=Temp;

end