function Blocks=ontable(Name,Blocks)

%Dla wywo�ania bez struktury, zak�adamy prac� na zmiennej globalnej
if nargout==0
    global Blocks
else
    
end

N=size(Blocks,2);
for i=1:N
    if Blocks(i).name==Name
        Blocks(i).ontable=1;
        Blocks(i).clear=1;
        Blocks(i).holding=0;
    end
end

end