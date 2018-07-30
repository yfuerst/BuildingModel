within BuildingModel.Functions;
function SumMatrixRow
  input Integer M[:,:];
  input Integer row;
  input Integer col;
  output Integer res;
algorithm
  res := sum(M[row, i] for i in 1:col);
end SumMatrixRow;
