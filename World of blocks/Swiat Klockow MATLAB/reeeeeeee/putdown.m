function Blocks=putdown(Name,Blocks)

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if nargout==0
    global Blocks
end
N=size(Blocks,2);


%Lista Stosowalnoœci
Failed=0;

for i=1:N
    if Blocks(i).name==Name
        if Blocks(i).holding==0
            Failed=1;
        end
    end
end

if Failed

    error('Operacja putdown nie jest mo¿liwa')
    
else
    %Lista Dospisków i Skreœleñ

    for i=1:N
        if Blocks(i).name==Name
            Blocks(i).ontable=1;
            Blocks(i).holding=0;
            Blocks(i).clear=1;
        end
    end
end

if nargout==0
    DrawBlocks(Blocks)
end

end