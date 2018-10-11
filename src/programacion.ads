package Functions with SPARK_Mode => On is

   type Binary is array (1 .. 32) of Boolean;

   function DecimalToBinary
     (Dec : Integer) return Binary with
     Global  => none,
     Pre => none,
     Post => true;

end Functions;
