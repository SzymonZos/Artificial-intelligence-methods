function Blocks=holding(Name,Blocks)

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if nargout==0
    global Blocks
end
    
N=size(Blocks,2);
for i=1:N
    if Blocks(i).name==Name
        Blocks(i).holding=1;
        Blocks(i).ontable=0;
        Blocks(i).clear=0;
    end
end

end