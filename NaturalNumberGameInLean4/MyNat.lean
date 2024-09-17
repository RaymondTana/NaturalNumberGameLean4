/- Natural Number Game using Lean4 -/
inductive MyNat where
  | zero: MyNat
  | succ: MyNat -> MyNat -- a function
  deriving Repr -- for prettier printouts

-- #check MyNat.zero
-- #check MyNat.succ (MyNat.zero)
-- #eval MyNat.succ (MyNat.zero)

open MyNat

/- Convert numerals from usual Nat library to MyNat -/
def nat_to_mynat (n: Nat): MyNat :=
  match n with
  | Nat.zero => MyNat.zero
  | Nat.succ n' => MyNat.succ (nat_to_mynat n')

/- Automatically converts instances of Nat to MyNat -/
instance : OfNat MyNat n where
  ofNat := nat_to_mynat n

/- Convert MyNat to numerals from Nat -/
def mynat_to_nat (n: MyNat): Nat :=
match n with
  | MyNat.zero => Nat.zero
  | MyNat.succ n' => Nat.succ (mynat_to_nat n')

#eval succ zero

def add (m: MyNat) (n: MyNat) : MyNat :=
  match n with -- adding by n? do as follows: (pattern matching)
  | zero => m
  | succ n' => succ (add m n')

-- permit the plus symbol as wrapper for add
instance : Add MyNat where
  add := add

-- #eval add (succ (succ zero)) (succ zero)
example : add 7 8 = 15 := rfl
example : add 0 1 = 1 := rfl
example : (0 : MyNat) + 1 = 1 := rfl

def mul (m: MyNat) (n: MyNat) : MyNat :=
  match n with -- multiplying by n? do as follows: (pattern matching)
  | zero => zero
  | succ zero => m
  | succ n' => add m (mul m n')

-- permit the times symbol as wrapper for mul
instance : Mul MyNat where
  mul := mul

example : mul 4 3 = 12 := rfl
example : mul 16 0 = 0 := rfl
example : mul 0 4 = 0 := rfl
example : 0 * 4 = 0 := rfl
example : 1 * 3 = 3 := rfl
