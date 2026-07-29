import canonicalLaneMathlib.AdmissibleClass
import EquationalClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure BirkhoffVarietyPackage (Σ : Signature) where
  V : Set (Algebra Σ)
  closedUnderHomomorphisms : ∀ A B : Algebra Σ, A ∈ V → (hom : Homomorphism A B) → B ∈ V
  closedUnderSubalgebras : ∀ (A : Algebra Σ) (S : Subalgebra A), A ∈ V → S.carrierAlgebra ∈ V
  closedUnderDirectProducts : ∀ (I : Type) (Ai : I → Algebra Σ), (∀ i, Ai i ∈ V) → DirectProduct Ai ∈ V

structure BirkhoffVarietyEvidence (Σ : Signature) (pkg : BirkhoffVarietyPackage Σ) where
  closedUnderHomomorphismsTerm : pkg.closedUnderHomomorphisms
  closedUnderSubalgebrasTerm : pkg.closedUnderSubalgebras
  closedUnderDirectProductsTerm : pkg.closedUnderDirectProducts

def BirkhoffVarietyClosed (Σ : Signature) (pkg : BirkhoffVarietyPackage Σ) : Prop :=
  pkg.closedUnderHomomorphisms ∧ pkg.closedUnderSubalgebras ∧ pkg.closedUnderDirectProducts

theorem birkhoff_variety_closed_from_evidence (Σ : Signature) (pkg : BirkhoffVarietyPackage Σ)
    (E : BirkhoffVarietyEvidence Σ pkg) : BirkhoffVarietyClosed Σ pkg :=
  And.intro E.closedUnderHomomorphismsTerm
    (And.intro E.closedUnderSubalgebrasTerm E.closedUnderDirectProductsTerm)

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse
