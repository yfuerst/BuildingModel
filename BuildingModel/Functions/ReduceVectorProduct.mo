within BuildingModel.Functions;
function ReduceVectorProduct
  input Real val "Real value";
  input Real vec[:] "Real vector to multiply value";
  input Integer out_size "Size of output vector";
  output Real out[out_size] "Reduced multiplied output";
  // Get size of vector
protected
  Integer vec_size=size(vec, 1) "Size of input vector";
  Real dummy[out_size]=zeros(out_size) "Dummy vector";
  Integer counter "Counter variable";
  Boolean is_zero=true "Status variable";
algorithm
  // Initialize counter
  counter := 1;
  // Iterate over input vector
  for i in 1:vec_size loop
    if vec[i] > 0 then
      // Check if vec contains only zeros
      if is_zero then
        is_zero := false;
      end if;
      // Multiply value unequal zero with val
      // Result is written in dummy and counter increased
      dummy[counter] := val*vec[i];
      counter := counter + 1;
    end if;
  end for;

  if is_zero then
    dummy[1] := val;
  end if;
  /*if out_size==1 then
    if dummy[out_size]==0 then
      dummy[out_size] := val;
    end if;
  end if;*/
  out := dummy;
end ReduceVectorProduct;
