import canonicalLaneMathlib.AdmissibleClass
import EquationalHomomorphism

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

def Subalgebra (Σ : Signature) (A : Algebra Σ) : Set (Algebra Σ) := {
  B : Algebra Σ |
  ∃ (h : B.carrier ⊆ A.carrier),
    (∀ (n : Nat) (f : Σ.operations n) (v : Vector B.carrier n),
      h (B.interpret n f v) = A.interpret n f (Vector.map (fun x => ⟨x, h x⟩) v))}

def Product (Σ : Signature) (I : Type u) (A : I → Algebra Σ) : Algebra Σ := {
  carrier := (i : I) → A i
  interpret := λ n f args i => A i.interpret n f (Vector.map (λ g => g i) args)
}

def HomomorphicImage (Σ : Signature) (A B : Algebra Σ) : Prop :=
  Nonempty (Homomorphism Σ A B)

def Variety (Σ : Signature) (V : Set (Algebra Σ)) : Prop :=
  (∀ A ∈ V, ∀ B ∈ Subalgebra Σ A, B ∈ V) ∧
  (∀ (I : Type u) (A : I → Algebra Σ), (∀ i, A i ∈ V) → Product Σ I A ∈ V) ∧
  (∀ A B, A ∈ V → HomomorphicImage Σ A B → B ∈ V)

theorem BirkhoffHSP (Σ : Signature) (V : Set (Algebra Σ)) : Variety Σ V ↔
  ∃ (E : Set (Equation Σ)), V = {A | ∀ e ∈ E, Nonempty (Model Σ A e)} := by
  constructor
  · intro hV
    refine ⟨{e | ∀ A ∈ V, Nonempty (Model Σ A e)}, ?_⟩
    ext A; constructor
    · intro hA; intro e he; exact he A hA
    · intro hA; refine ⟨?_, ?_, ?_⟩
      · intro B hB; exact hA B ?_
      · intro I B hB; exact hA (Product Σ I B) ?_
      · intro B hB; exact hA B ?_
  · intro h
    rcases h with ⟨E, hE⟩
    refine ⟨?_, ?_, ?_⟩
    · intro A hA B hB; apply hE; intro e; exact hA e
    · intro I A hA; apply hE; intro e; refine ⟨?_, ?_, ?_⟩
    · intro A B hA hB; apply hE; intro e; exact hA e

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse