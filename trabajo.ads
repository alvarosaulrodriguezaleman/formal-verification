package Trabajo with SPARK_Mode => On is

   type N_Array is array (Positive range <>) of Integer;
   
   -- changeC --
   -- Replaces all instances of charOff in string Str to charOn
   procedure changeC (Str : in out String;
                    charOn, charOff : Character) with
     Pre => Str'Length > 0, 
     Post => ( for all J in Str'Range =>
                 (if Str'Old(J) = charOff then Str(J) = charOn else
                      Str(J) = Str'Old(J)));
   
   -- replaceEven --
   -- Replaces all even numbers in array Arr to 0
   procedure replaceEven (Arr : in out N_Array) with
     Pre => Arr'Length > 0, 
     Post => ( for all J in Arr'Range =>
                 (if (Arr'Old(J) rem 2) = 0 then Arr(J) = 0 else
                      Arr(J) = Arr'Old(J)));
 
   -- Substring --
   -- Returns a new String with the characters from pos to Str'Last
   function Substring (Str : String; pos : Integer) return String with
     Pre => pos in Str'Range and Str'Last < Integer'Last,
     Post => ( for all J in pos..Str'Last =>
                Substring'Result(J) = Str(J));

end Trabajo;
