import canonicalLaneMathlib.AdmissibleClass
import EquationalSignature

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure Algebra (Σ : Signature) where
  carrier : Type u
  interpret : (n : Nat) → Σ.operations n → (Vector carrier n → carrier)

structure Equation (Σ : Signature) where
  lhs : Term Σ.operations
  rhs : Term Σ.operations

structure Model (Σ : Signature) (A : Algebra Σ) (E : Equation Σ) : Prop where
  satisfies : ∀ (env : String → A.carrier), eval A E.lhs env = eval A E.rhs env
  where
    eval (A : Algebra Σ) (t : Term Σ.operations) (env : String → A.carrier) : A.carrier :=
      match t with
      | Term.var x => env x
      | Term.op f args => A.interpret _ f (Vector.map (eval A · env) args)

def ModelClass (Σ : Signature) : Type (u+1) := Set (Algebra Σ)

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse