within BuildingModel.Functions;
function CountNumbersUpperDiagonal
  input Real M[:,:];
  input Integer row;
  input Integer col;
  output Integer counter;
protected
  Integer nVec=(size(M, 1) - 1)*(size(M, 1) - 1);
  Real MVec[nVec];
  Integer nRow=size(M, 1);
  Integer index;
  Integer pos;
  Integer k;
algorithm
  assert(row <= nRow, "row = " + String(row) + " greater than the row dimension " + String(size(M, 1)));
  assert(col <= nRow, "col = " + String(col) + " greater than the column dimension " + String(size(M, 2)));
  assert(col > 1, "col = " + String(col) + " need to be greater than 1");
  index := 0;
  for i in 1:(nRow - 1) loop
    for j in (i + 1):nRow loop
      index := index + 1;
      MVec[index] := M[i, j];
    end for;
  end for;
  pos := 0;
  for i in 1:row loop
    pos := pos + nRow - i;
  end for;
  pos := pos - (nRow - col);
  k := 0;
  for i in 1:pos loop
    if MVec[i] > 0 then
      k := k + 1;
    end if;
  end for;
  counter := k;
end CountNumbersUpperDiagonal;
