function DrawBlocks(B)

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if nargin==0
    global Blocks
else
    Blocks=B;
end

clf();
N=size(Blocks,2);
Pos(N,N)=0;

for i=1:N
    if Blocks(i).ontable==1
        rectangle('Position',[i-0.9 0 0.8 1]);
        text(i-0.5, 0.5,Blocks(i).name);
        Pos(1,i)=Blocks(i).name;
    end
end

for j=1:N
    for i=1:N
        if Blocks(i).on~=0
            [y,x]=find(Pos==Blocks(i).on);
            if ~isempty(x)
                Pos(y+1,x)=Blocks(i).name;
                rectangle('Position',[x-0.9 y 0.8 1]);
                text(x-0.5, y+0.5,Blocks(i).name);
            end
        end
    end
    if nnz(Pos)==N
        break;
    end
end

for i=1:N
    if Blocks(i).holding==1
        rectangle('Position',[0.1 N+0.5 0.8 0.95]);
        text(0.5, N+1,Blocks(i).name);
    end
end

line([0.05 0.05 1 1],[N+1 N+1.5 N+1.5 N+1]);
line([0.5 0.5],[N+1.5 N+1.9]);
axis([0 N 0 N+2]);

end