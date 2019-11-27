function Solutions=Heuristic(Init,Final)

Solutions=struct('f',@CreateBlocks,'var',0,'prev',0,'state',Init,'cost',[0 0]);

Funs={@pickup @putdown @unstack};
Funs2p={@stack};
cost=[0 0]; %[g g+h]

for k=1:20000
        Costs=vertcat(Solutions.cost);
    [MinVal,MinPos]=min(Costs(:,2));
    cost(:)=Solutions(MinPos).cost(1)+1;
    Solutions(MinPos).cost(2)=99999;
    prev=MinPos;
    State=Solutions(MinPos).state;
for i=1:size(State,2)
    
    for f=1:size(Funs,2)
        [Out,h,Possible]=tryStep(State,Final,Funs(f),char(64+i),Solutions);
        if Possible>0
            pt=size(Solutions,2)+1;
            Solutions(pt)=struct('f',Funs(f),'var',char(64+i),'prev',prev,'state',Out,'cost',cost+h);
        end
        if Possible==2
            return;
        end
    end

    %Ten sam kod, ale dla funkcji z 2ma parametrami:
    
    for f=1:size(Funs2p,2)
        for j=1:size(State,2)
            [Out,h,Possible]=tryStep(State,Final,Funs2p(f),[char(64+i) char(64+j)],Solutions);
            if Possible>0
                pt=size(Solutions,2)+1;
                Solutions(pt)=struct('f',Funs2p(f),'var',[char(64+i) char(64+j)],'prev',prev,'state',Out,'cost',cost+h);
            end
            if Possible==2
                return;
            end
        end
    end
    
end


end

end

function [Blocks,cost,Possible]=tryStep(Blocks,Final,fun,FunParam,Solutions)

Params=size(FunParam,2);
cost(2)=0;

try
    switch Params
        case 1
            Blocks=fun{1}(FunParam(1), Blocks);
        case 2
            Blocks=fun{1}(FunParam(1),FunParam(2), Blocks);
        case 3
            Blocks=fun{1}(FunParam(1),FunParam(2),FunParam(3), Blocks);
        otherwise
            fun{1}(Blocks);
    end
    
    Possible=1;
    if isequaln(Blocks,Final)
        Possible=2;
    end
    for i=1:size(Solutions,2)
        if isequaln(Solutions(i).state,Blocks)
            Possible=0;
        end
    end
    
    cost(2)=cost(2)+sum(abs(vertcat(Blocks.ontable)-vertcat(Final.ontable)));
    cost(2)=cost(2)+sum(abs(vertcat(Blocks.clear)-vertcat(Final.clear)));
    %tu jakies wagi
catch
    Possible=0;
end

end



