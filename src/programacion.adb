
with Ada.Text_IO; use Ada.Text_IO;

package body Functions with SPARK_Mode => On is

   function DecimalToBinary ( Dec : Integer ) return Binary is
      BinaryNumber : Binary := (others => false);
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

end Functions;
