This is a still-in-progress development repository for producing POMDP Active Inference agents using julia, RxInfer, and other utilities.

### TODO/Issues/Notes:
- `A_1` and `A_2` matrix construction still separate computations
- Inference results for learning `A_1` odd over time; what should be final arises early during inference; due to reactive framework..? 
- Control needed
- Action-perception loop needed, e.g., initializeAgent(), act(), execute(), observe() need to be defined

### Sources/References:
- 	Koudahl, M., van de Larr, T., & de Vries, B. "Realising Synthetic Active Inference Agents, Part I: Epistemic Objectives and Graphical Specification Language". (2023). arXiv preprint 
https://doi.org/10.48550/arXiv.2306.08014
  - c.f. Part II
  - with accompanying code https://github.com/biaslab/LAIF
- Message Passing and Reactive framework: Reactive Message Passing for Scalable Bayesian Inference. Dimtry Bagaev and Bert de Vries. (2023) Hindawi; Scientific Programming, .  https://doi.org/10.1155/2023/6601690
- ReactiveBayes / BIASlab, https://github.com/ReactiveBayes/RxInfer.jl
- RxInfer: A Julia package for reactive real-time Bayesian inference. Dmitry Bagaev, Albert Podusenko, and Bert de Vries. The Journal of Open Source Software (2023). https://joss.theoj.org/papers/10.21105/joss.05161
- Reactive framework and RxInfer.jl package: https://www.youtube.com/watch?v=qXrvDVm_fnE
