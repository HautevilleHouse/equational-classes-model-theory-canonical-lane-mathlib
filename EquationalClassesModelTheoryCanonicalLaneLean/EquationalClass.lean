import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure Signature where
  operationSymbols : Type u
  arity : operationSymbols → ℕ

structure Algebra (Σ : Signature) where
  carrier : Type v
  operations : (f : Σ.operationSymbols) → (Σ.arity f → carrier) → carrier

structure Identity (Σ : Signature) (X : Type w) where
  lhs : Term Σ X
  rhs : Term Σ X

inductive Term (Σ : Signature) (X : Type w) where
  | var : X → Term Σ X
  | op : (f : Σ.operationSymbols) → (Σ.arity f → Term Σ X) → Term Σ X

def Term.eval {Σ : Signature} {X : Type w} (t : Term Σ X) (A : Algebra Σ) (env : X → A.carrier) : A.carrier := by
  induction t with
  | var x => exact env x
  | op f args => exact A.operations f (λ i => (args i).eval A env)

def Algebra.satisfiesIdentity (A : Algebra Σ) (eq : Identity Σ X) : Prop :=
  ∀ env : X → A.carrier, (eq.lhs.eval A env) = (eq.rhs.eval A env)

structure EquationalClass (Σ : Signature) where
  algebras : Set (Algebra Σ)
  closedUnderIdentities : ∀ (eq : Identity Σ (∅ : Type)), (∀ A ∈ algebras, A.satisfiesIdentity eq) →
    ∀ A, A ∈ algebras

structure EquationalAdmittedObject where
  signature : Signature
  equationalClass : EquationalClass signature
  conclusion : Prop

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse
