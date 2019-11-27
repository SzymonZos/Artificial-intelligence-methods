function Blocks=ReadSTRIPS(fileName)

if nargout==0
    global Blocks
end

Temp=struct();

file=fopen(fileName);
tline = fgetl(file);
while ischar(tline)
    Str=split(tline,["(",",",")"]);
    fun=str2func(char(Str(1)));
    Params=size(Str,1)-2;
    switch Params
        case 1
            Temp=fun(char(Str(2)), Temp);
        case 2
            Temp=fun(char(Str(2)),char(Str(3)), Temp);
        case 3
            Temp=fun(char(Str(2)),char(Str(3)),char(Str(4)), Temp);
        case 4
            Temp=fun(char(Str(2)),char(Str(3)),char(Str(4)),char(Str(5)), Temp);
        otherwise
            fun(Temp);
    end
    tline = fgetl(file);
end

fclose(file);
Blocks=Temp;

end