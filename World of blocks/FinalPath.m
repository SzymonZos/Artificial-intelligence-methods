function Path=FinalPath(Solutions)
pt=size(Solutions,2);
i=Solutions(pt).cost(1);
clear Path;

while pt>1
    Path(i)=Solutions(pt);
    pt=Solutions(pt).prev;
    i=i-1;
end

DrawBlocks(Solutions(1).state)

for j=1:size(Path,2)
    disp([func2str(Path(j).f),'(',Path(j).var,')']);
    waitforbuttonpress;
    DrawBlocks(Path(j).state)
end

end


