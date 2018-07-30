within BuildingModel.Functions;
function CountOnes
  input Integer M[:,:];
  input Integer row;
  input Integer col;
  output Integer counter;
protected
  Integer nRow=size(M, 1);
  Integer nVec=size(M, 1)*size(M, 2);
  Integer MVec[nVec];
  Integer pos;
  Integer k = 0;
algorithm
  for i in 1:size(M, 1) loop
    for j in 1:size(M, 2) loop
      MVec[j + (i - 1)*nRow] :=M[i, j];
    end for;
  end for;
  pos := col + (row - 1)*nRow;
  for i in 1:pos loop
    k := k + MVec[i];
  end for;
  counter := k;
end CountOnes;
