import canonicalLaneMathlib.AdmissibleClass
import EquationalAlgebra

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure Homomorphism (Σ : Signature) (A B : Algebra Σ) where
  map : A.carrier → B.carrier
  preserves : (n : Nat) → (f : Σ.operations n) → (args : Vector A.carrier n) →
              map (A.interpret n f args) = B.interpret n f (Vector.map map args)

structure Congruence (Σ : Signature) (A : Algebra Σ) where
  rel : A.carrier → A.carrier → Prop
  isEquivalence : Equivalence rel
  compatible : (n : Nat) → (f : Σ.operations n) → (args₁ args₂ : Vector A.carrier n) →
               Vector.Forall₂ rel args₁ args₂ → rel (A.interpret n f args₁) (A.interpret n f args₂)

structure QuotientAlgebra (Σ : Signature) (A : Algebra Σ) (θ : Congruence Σ A) where
  carrier : Type u := Quot θ.rel
  interpret : (n : Nat) → Σ.operations n → (Vector carrier n → carrier) := λ n f args =>
    Quot.mk θ.rel (A.interpret n f (Vector.map Quot.out args))

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse