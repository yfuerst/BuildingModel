within BuildingModel.Functions;
function CountTrue
  input Boolean V[:];
  input Integer pos;
  output Integer counter;
protected
  Integer k = 0;
algorithm
  for i in 1:pos loop
    if V[i] then
      k := k + 1;
    end if;
  end for;
  counter := k;
end CountTrue;
