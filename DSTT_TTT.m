M = input('Nhap ma tran can phan tich svd');   %nxm
Mt = transpose(M);  
MtM = Mt*M;         %nxn
MMt = M*Mt;         %mxm
sizeOfMatrix = size(M);    

run = 1;
[v2,d2] = eig(MtM);
while(run==1)
for i=1: (sizeOfMatrix(2)-1)
    run = 0;
    if d2(i,i) <= d2(i+1,i+1)
        run = 1;
        temp = d2(i,i);
        d2(i,i) = d2(i+1,i+1);
        d2(i+1,i+1) = temp;
        for j=1:sizeOfMatrix(2)
            temp = v2(j,i);
            v2(j,i) = v2(j,i+1);
            v2(j,i+1) = temp;
        end
    end
end
for i=1: (sizeOfMatrix(2)-1)
    if d2(i,i) <= d2(i+1,i+1)
        run = 1;
    end
end
end
 d2 = d2^(1/2);
 invertS = d2^(-1);
 U = M*v2*invertS;
 disp('matrix dau vao: ');
 disp(U*d2*transpose(v2));
 disp('duoc phan tich thanh :');
 disp(U);
 disp(d2);
 disp(v2);
