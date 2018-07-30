within BuildingModel.Functions;
function SumNumbersMatrixRow
  input Real M[:,:];
  input Integer row;
  input Integer col;
  output Integer res;
algorithm
  res := 0;
  for i in 1:col loop
    if M[row, i] > 0 then
      res := res + 1;
    end if;
  end for;
end SumNumbersMatrixRow;
