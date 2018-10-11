package Functions with SPARK_Mode => On is

   type B_Binary is array (1 .. 32) of Boolean;

   function DecimalToBinary
     (Dec : Integer) return B_Binary with
     Global  => none,
     Pre => none,
     Post => true;



   function BinaryToDecimal
     (Binary : B_Binary) return Integer;
   --Function that converts Binary(array of boleans) into
   -- a decimal Integer

end Functions;
