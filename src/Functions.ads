
package Functions with SPARK_Mode => On is

   Type T_Sucesion is array (Positive range<>) of Natural;

   function Sucesion
     (N_Elements : Positive; By : Natural) return T_Sucesion with

     Depends => (Sucesion'Result => (N_Elements, By)),

     Pre => N_Elements < Positive'Last
     and then By < Natural'Last
     and then By < Positive'Last/N_Elements,

     Post => (for all J in 1 .. N_Elements => Sucesion'Result (J) = J*By);

   -- Creates an array of n elements with a sucession of multiples of by number
   -- starting in by

   type Positives is array (Positive range <>) of Integer;
   type V_Vector is array (1 .. 3) of Positive;

   function PositiveOrNegative
     (Num : Integer) return Boolean with

     Pre => Num < Integer'Last
     and Num > Integer'First,

     Post => (if Num >= 0 then
                PositiveOrNegative'Result = TRUE)
     and (if Num < 0  then
            PositiveOrNegative'Result = FALSE);


    --Function, return true if Num is positive
    --and return false if Num is negative.


   function PositiveOrNegativeVector
     (Positiv : Positives) return Positives with

     Depends => (PositiveOrNegativeVector'Result => (Positiv)),

     Pre => (for all I in Positiv'Range =>
               Positiv(I) > Integer'First),

     Post => (for all I in PositiveOrNegativeVector'Result'Range =>
                PositiveOrNegativeVector'Result(I) = Positiv(I) * (-1));

   --Returns the vector given multiplied by -1



   function MultVector
     (Vector: V_Vector) return Positive with

     Pre => Vector(2) < Positive'Last / Vector(3)
     and then Vector(1) < (Positive'Last / (Vector(2) * Vector(3) )),

     Post =>
       MultVector'Result = Vector(Vector'First) * Vector(Vector'First + 1) * Vector(Vector'Last);

   --Function that multiply a vector of length = 3.


   type Vector is array (Positive range <>) of Positive;
   type B_Binary is array (Positive range <>) of Boolean;

   function MidTerm
     (Values : Vector ; From : Positive ; To : Positive) return B_Binary with
     Depends => (Midterm'Result => (Values, From, To)),

     Pre =>
       From <= To
       and then Values'Last < Positive'Last
       and then Values'Last > Values'First,

     Post => (for all I in Values'Range =>
                (if Midterm'Result(I) then
                     (Values(I) >= From and Values(I) <= To)
                       else
                   (Values(I) <= From or Values(I) >= To)));

   -- Funcion que devuelve un vector con True o False en las posiciones donde en
   -- Vector pasado por parámetro hay un elemento que se encuentra entre From y To

end Functions;
