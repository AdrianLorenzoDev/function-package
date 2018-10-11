package Functions with SPARK_Mode => On is

   type B_Binary is array (1 .. 32) of Boolean;
   type Polynomic is array(Positive range <>) of Integer;

   function DecimalToBinary
     (Dec : Integer) return B_Binary with
     Global  => none,
     Pre => none,
     Post => true;



   function BinaryToDecimal
     (Binary : B_Binary) return Integer;
   --Function that converts Binary(array of boleans) into
   -- a decimal Integer


   function PolynomialFunctionSolver
     (Poly : Polynomic; Value : Integer) return Integer with
     Global=> None,

     Pre=> Value > Integer'First
     and Value < Integer'Last
     and (for all I in Poly'Range => Poly(I) * (Value**(Poly'Last-I)) > Integer'First
              and Poly(I) * (Value**(Poly'Last-I)) < Integer'Last),

     Pos=> PolynomialFunctionSolver'Result;


end Functions;
