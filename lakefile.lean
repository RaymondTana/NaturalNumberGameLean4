import Lake
open Lake DSL

package "NaturalNumberGameInLean4" where
  version := v!"0.1.0"
  keywords := #["math"]
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩ -- pretty-prints `fun a ↦ b`
  ]

require "leanprover-community" / "mathlib"

@[default_target]
lean_lib «NaturalNumberGameInLean4» where
  -- add any library configuration options here
