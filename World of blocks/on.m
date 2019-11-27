function Blocks=on(ktory,gdzie,Blocks)

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if nargout==0
    global Blocks
end

N=size(Blocks,2);
for i=1:N
    if Blocks(i).name==ktory
        Blocks(i).on=gdzie;
        Blocks(i).clear=1;
        Blocks(i).holding=0;
    end
end

for i=1:N
    if Blocks(i).name==gdzie
        Blocks(i).clear=0;
    end
end

end