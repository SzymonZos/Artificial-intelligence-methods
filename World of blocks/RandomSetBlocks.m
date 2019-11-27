function Blocks=RandomSetBlocks(N)

PrawdopWiezy = 0.5;

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if nargout==0
    global Blocks
end

Blocks=CreateBlocks(N)

AtLeastOne=0;

RandPt=randperm(N);
RandPt2=randperm(N);
Blocks=ontable(Blocks(RandPt(1)).name,Blocks);

for i=2:N
    if rand(1)>PrawdopWiezy
        Blocks=ontable(Blocks(RandPt(i)).name,Blocks);
    else
        for j=1:N
            if Blocks(RandPt(j)).clear==1
                Blocks=on(Blocks(RandPt(i)).name,Blocks(RandPt(j)).name,Blocks);
                break;
            end
        end
    end
end



DrawBlocks(Blocks)

end