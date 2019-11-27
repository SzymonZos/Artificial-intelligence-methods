function Blocks=stack(Name,Gdzie,Blocks)

%Dla wywo�ania bez struktury, zak�adamy prac� na zmiennej globalnej
if nargout==0
    global Blocks
end
N=size(Blocks,2);


%Lista Stosowalno�ci
Failed=0;

for i=1:N
    if Blocks(i).name==Name
        if Blocks(i).holding==0
            Failed=1;
        end
    end
    if Blocks(i).name==Gdzie
        if Blocks(i).clear==0 || Blocks(i).holding~=0
            Failed=1;
        end
    end
end

if Failed

    error('Operacja pickup nie jest mo�liwa')
    
else
    %Lista Dospisk�w i Skre�le�

    for i=1:N
        if Blocks(i).name==Name
            Blocks(i).holding=0;
            Blocks(i).clear=1;
            Blocks(i).on=Gdzie;
        end

        if Blocks(i).name==Gdzie
            Blocks(i).clear=0;
        end
    end
end

if nargout==0
    DrawBlocks(Blocks)
end

end