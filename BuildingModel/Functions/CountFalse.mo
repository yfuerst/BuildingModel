within BuildingModel.Functions;
function CountFalse
  input Boolean V[:];
  input Integer pos;
  output Integer counter;
protected
  Integer k = 0;
algorithm
  for i in 1:pos loop
    if not V[i] then
      k := k + 1;
    end if;
  end for;
  counter := k;
end CountFalse;
