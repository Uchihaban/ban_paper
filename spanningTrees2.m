function trees = spanningTrees2(size, edges)
% �ҵ�ͼ��������������matlabʵ��

%���룺
% size��ͼ�е�ĸ���
% edges����ͼ����n���ߣ���edges��n*2�ľ��󣬾����ÿһ�д���ͼ�е�һ���ߣ������1�͵�2��һ���ߣ���edges��һ���ǣ�1,2����
% ����� 
% �������������ڽӱ���һ����ά����
size=7;
number = length(s2);
testEdges = zeros(size-1,2);
test = nchoosek(1:number,size-1);
% test = combntns(1:number,size-1);
%�漰������������⣬matlab�Ѿ�ʵ�ֺ��ˣ���combntns(A,size) ����ʵ�ִ�A��ѡȡsize��Ԫ��
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