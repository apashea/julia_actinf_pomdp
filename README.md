This is a still-in-progress development repository for producing POMDP Active Inference agents using julia, RxInfer, and other utilities.

### Update 15 October 2024:
- Added `T-maze_Generalized_flattened_bkp.ipynb` in `scripts/`. This ipynb notebook is adapted from the biaslab LAIF T-maze POMDP script (github.com/biaslab/LAIF) in Part 2 for generalized free energy minimization. This notebook is to be run on a julia kernel (e.g., latest version). More specifically, it is a "flattened" version of the T-maze_Generalized.ipynb script in Part2 folder of the repo.

Purpose: The LAIF script: 
- 1) provides a POMDP-style agent and environment which can read discrete observations, infer discrete hidden state factor levels, and commit discrete actions, in contrast to the many continuous space models in the RxInfer Examples scripts (with the exception of the How to train your HMM script, which itself is lacking in that it acts only as a percetual model which cannot infer/commit actions), and
- 2) it uses generalized free energy, computed locally per node, which has various benefits and may represent an advance in applying ActInf (see the LAIF papers for more information) beyond previous formulations (that said, other scripts in the LAIF repo follow similar code/logic if one wanted to use other free energy formulations).
- 3) the ability to add POMDP-style models allows creating agents who have more clearly interpretable parameters for task-specific use-cases, with discrete actions/policies.

Why this file? Why flattened?:
- (begin tongue-in-cheek rant) Despite the apparent utility of dividing up the many, many functions used in these and other RxInfer-related scripts into various .jl scripts and using include("file.jl") to use them in a main script, these various .jl's contain important sections, for example for constructing state transition and likelihood matrices which are then used elsewhere, rendering adapting these scripts to one's own purposes and creating one's own models, at best, a time-consuming scavenger hunt and, at worst, a keyboard-banging headache.
- On top of this, accessibility for newcomers is awful as there can be bottlenecks to running the code at all if there is some inconsistency or otherwise in the Project.toml and Manifest.toml files, or simply the amount of operations and dependency installations/resolutions to import them. Just to illustrate, I installed julia and other necessary software fresh on a pc, git clone'd the repo, and it stalled out when trying to follow the .toml logics. I thought I made a mistake in my installation, but no, running a local script from outside of the cloned repo worked just fine as expected.
- "Flattened" here means "I grabbed all of the necessary code to run the script and put it into the same notebook. All necessary packages to be installed are in a single cell at the top, therefore you only install what you need and we don't worry about externally downloaded .toml files to be loaded or stalling out. Everything is all in one, and now you have all relevant code at your fingertips for testing and experimentation purposes." One file, one and done.

### TODO/Issues/Notes:
- `A_1` and `A_2` matrix construction still separate computations
- Inference results for learning `A_1` odd over time; what should be final arises early during inference; due to reactive framework..? 
- Control needed
- Action-perception loop needed, e.g., initializeAgent(), act(), execute(), observe() need to be defined

### Acknowledgements:
- We are grateful to the entire team at BIASlab for the incredible work they do in developing RxInfer, the reactive framework, and creating and contributing to the use of Active Inference in real-world applications.

### Sources/References:
- 	Koudahl, M., van de Larr, T., & de Vries, B. "Realising Synthetic Active Inference Agents, Part I: Epistemic Objectives and Graphical Specification Language". (2023). arXiv preprint 
https://doi.org/10.48550/arXiv.2306.08014
  - c.f. Part II
  - with accompanying code https://github.com/biaslab/LAIF
- Message Passing and Reactive framework: Reactive Message Passing for Scalable Bayesian Inference. Dimtry Bagaev and Bert de Vries. (2023) Hindawi; Scientific Programming, .  https://doi.org/10.1155/2023/6601690
- ReactiveBayes / BIASlab, https://github.com/ReactiveBayes/RxInfer.jl
- RxInfer: A Julia package for reactive real-time Bayesian inference. Dmitry Bagaev, Albert Podusenko, and Bert de Vries. The Journal of Open Source Software (2023). https://joss.theoj.org/papers/10.21105/joss.05161
- Reactive framework and RxInfer.jl package: https://www.youtube.com/watch?v=qXrvDVm_fnE
