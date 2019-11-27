function B=CreateBlocks(N,B)

%Dla wywo³ania bez struktury, zak³adamy pracê na zmiennej globalnej
if ischar(N)
    N=str2num(N);
end

B=struct('name',char(65),'ontable',0,'clear',0','on',0,'holding',0);
for i=2:N
    B(i)=struct('name',char(64+i),'ontable',0,'clear',0','on',0,'holding',0);
end

if nargout==0
    global Blocks
    Blocks=B;
end

end