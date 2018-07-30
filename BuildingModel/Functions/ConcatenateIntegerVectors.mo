within BuildingModel.Functions;
function ConcatenateIntegerVectors
  input Integer vecIn[:];
  input Integer nVec;
  output Integer vecOut[nVec*size(vecIn, 1)];
algorithm
  for j in 1:nVec loop
    for i in 1:size(vecIn, 1) loop
      vecOut[(j - 1)*size(vecIn, 1) + i] := vecIn[i];
    end for;
  end for;
end ConcatenateIntegerVectors;
