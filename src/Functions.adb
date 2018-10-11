
with Ada.Text_IO; use Ada.Text_IO;

package body Functions with SPARK_Mode => On is

   function DecimalToBinary ( Dec : Integer ) return B_Binary is
      BinaryNumber : B_Binary := (others => false);
      DecimalNumber : Integer := Dec;
   begin

      for I in reverse BinaryNumber'Range loop

         if (DecimalNumber rem 2) = 0 then
            BinaryNumber (I) := false;
         else
            BinaryNumber(I) := true;
         end if;

         DecimalNumber := DecimalNumber / 2;

         if DecimalNumber <= 0 then
            return BinaryNumber;
         end if;

--       pragma Loop_Invariant =>
--           (DecimalNumber = DecimalNumber'Loop_Entry/(2*I));
      end loop;

      return BinaryNumber;

   end DecimalToBinary;

   function BinaryToDecimal
     (Binary : B_Binary) return Integer is
      res : Integer :=0;
      counter : Integer :=0;
   begin
      for I in reverse 1 .. Binary'Last loop
         if (Binary(I) = true) then
         res := res + 2**counter;
         end if;
         counter := counter +1;
   end loop;
        return res;
   end BinaryToDecimal;


   function PolynomialFunctionSolver
     (Poly : Polynomic; Value : Integer) return Integer is

      Result : Integer := 0.0;

   begin
      for I in Poly'Range loop
         Result := Result + (Poly (I) * (value**(Poly'Last-I)));
      end loop;
      return result;
   end PolynomialFunctionSolver;


end Functions;
