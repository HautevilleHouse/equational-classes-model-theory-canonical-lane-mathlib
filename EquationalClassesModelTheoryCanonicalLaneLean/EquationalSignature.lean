import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure EquationalSignature where
  operationSymbols : Type u
  arity : operationSymbols → Nat
  relationSymbols : Type v
  relationArity : relationSymbols → Nat

structure Term (α : Type w) where
  var : α → Term α
  op : (f : operationSymbols) → (args : List (Term α)) → (h : arity f = args.length) → Term α

define EquationalTheory (S : EquationalSignature) where
  equations : Set (Term (indexedType) × Term (indexedType))

define EquationalTheory.Model (M : Type) [Structure S M] (T : EquationalTheory S) : Prop :=
  ∀ (eq : T.equations), M ⊧ eq

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse