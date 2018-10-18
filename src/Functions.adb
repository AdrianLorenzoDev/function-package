package body Functions with SPARK_Mode => On is

   function Sucesion
     (N_Elements: Positive; By : Natural) return T_Sucesion is

      Result : T_Sucesion (1 .. N_Elements) := (others => 0);
   begin

      for I in 1 .. N_Elements loop
         Result (I) := By * I;

         pragma Loop_Invariant
           (for all J in 1..I => Result (J) = (By*J));
      end loop;

      return Result;

   end Sucesion;

   function PositiveOrNegative (Num : Integer) return Boolean is
   begin
      if Num >= 0 then
         return True;
      else
         return False;
      end if;
   end PositiveOrNegative;

   function PositiveOrNegativeVector (Positiv : Positives) return Positives is
      ResArray : Positives (Positiv'Range) := (others=>0);
   begin
      for I in Positiv'Range loop
         ResArray(I) := Positiv(I) * (-1);

         pragma Loop_Invariant
           ((for all J in Positiv'First .. I =>
                 (ResArray(J) = -1 * Positiv(J))));
      end loop;
      return ResArray;
   end PositiveOrNegativeVector;


   function MultVector
     ( Vector: V_Vector) return Positive is
      res : Positive := 1;
   begin
      for I in Vector'First .. Vector'Last loop
         res := res * Vector(I);

         pragma Loop_Invariant
           ((if I = Vector'First then
                 res = Vector(1)
            elsif I = Vector'Last then
               res = Vector(1) * Vector(2) * Vector(3)
            elsif I = (Vector'First+1) then
               res = Vector(1) * Vector(2)));

      end loop;
      return res;
   end MultVector;


   function Midterm
     (Values : Vector ; From : Positive ; To : Positive) return B_Binary is
      Result : B_Binary (Values'Range) := (others => False);
   begin
      for I in Values'Range loop
         if Values(I) >= From and Values(I) <= To then
            Result(I) := True;
         end if;

         pragma Loop_Invariant
           ( for all J in Values'First .. I =>
             (if Result(J) then (Values(J) >= From and Values(J) <= To)
              else (Values(J) <= From or Values(J) >= To)
             )
           );
      end loop;
      return Result;
   end Midterm;


end Functions;

