function trees = spanningTrees2(size, edges)
% 找到图中所有生成树的matlab实现

%输入：
% size：图中点的个数
% edges：若图中有n条边，则edges是n*2的矩阵，矩阵的每一行代表图中的一条边，例如点1和点2有一条边，则edges有一行是（1,2）。
% 输出： 
% 所有生成树的邻接表，是一个三维矩阵。
size=7;
number = length(s2);
testEdges = zeros(size-1,2);
test = nchoosek(1:number,size-1);
% test = combntns(1:number,size-1);
%涉及到组合数的问题，matlab已经实现好了，用combntns(A,size) 可以实现从A中选取size个元素
edges=B;


su = 1;
trees = [];
for i=1:length(test)
    for j = 1:size-1
        testEdges(j,1) = edges(test(i,j),1);
        testEdges(j,2) = edges(test(i,j),2);
    end
    graph = zeros(size,size);
    for k = 1:size-1
        graph(testEdges(k,1),testEdges(k,2)) = 1;
        graph(testEdges(k,2),testEdges(k,1)) = 1;
    end
    current = zeros(1,size);
    current(1) = 1;
    mark = zeros(1,size);
    mark(1) = 1;
    while sum(current) > 0
        next = zeros(1,size);
        for j = 1:size
            if current(j)>0
                for k = 1:size
                    if k ~= j && graph(j,k) > 0 && mark(k) == 0
                        mark(k) = 1;
                        next(k) = 1;
                    end
                end
            end
        end
        current = next;
    end
    if sum(mark) == size
        trees(:,:,su) = graph;
        su = su + 1;
    end
end
end