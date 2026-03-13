#import "/lib.typ": *

= Graph Theory

Graphs are mathematical structures used to model pairwise relationships between objects. A graph consists of a set of vertices (representing the objects) and a set of edges (representing the relationships). This deceptively simple structure captures an enormous variety of real-world situations: road networks, social connections, circuit layouts, scheduling dependencies, and communication networks can all be modelled as graphs. This chapter introduces the fundamental definitions, properties, and theorems of graph theory.

In this chapter we study:
- *Introduction to graphs:* definitions, types, and the degree of a vertex
- *Walks, trails, and circuits:* movement through graphs, and the classical results of Euler and Hamilton
- *Matrix representations:* encoding graphs as adjacency and incidence matrices
- *Trees:* acyclic connected graphs and their properties

== Introduction to Graphs

=== Definitions and Terminology

#definition[
  A *graph* $G = (V, E)$ consists of a non-empty finite set $V$ of *vertices* (or *nodes*) and a set $E$ of *edges*, where each edge is an unordered pair $\{u, v\}$ of distinct vertices. We say:
  - $u$ and $v$ are *adjacent* (or *neighbours*) if $\{u, v\} in E$;
  - an edge $e = \{u, v\}$ is *incident* to both $u$ and $v$;
  - a vertex with no incident edges is *isolated*.

  The *order* of $G$ is $|V|$ (the number of vertices); the *size* of $G$ is $|E|$ (the number of edges).
]

#note[
  Unless stated otherwise, all graphs in this chapter are *simple*: no loops (edges from a vertex to itself) and no multiple edges between the same pair of vertices.
]

#definition[
  A *loop* is an edge $\{v, v\}$ from a vertex to itself. A *multigraph* allows multiple edges between the same pair of vertices. A graph permitting both loops and multiple edges is a *pseudograph*.

  A *directed graph* (or *digraph*) $G = (V, E)$ has *directed edges* (arcs) which are ordered pairs $(u, v)$; the vertex $u$ is the *tail* and $v$ is the *head* of the arc.
]

#example[
  Let $V = \{a, b, c, d\}$ and $E = \{\{a,b\}, \{b,c\}, \{c,d\}, \{a,d\}, \{b,d\}\}$. Then $G = (V, E)$ is a graph of order 4 and size 5. Vertices $a$ and $c$ are not adjacent; vertices $b$ and $d$ are adjacent.
]

#diagram(caption: [
  The graph $G = (V, E)$ with $V = {a, b, c, d}$ and
  $E = \{\{a,b\},\{b,c\},\{c,d\},\{a,d\},\{b,d\}\}$, which has order~4 and size~5.
  Vertex $a$ and vertex $c$ share no edge.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let va = (0.0, 1.8)
      let vb = (1.8, 1.8)
      let vc = (1.8, 0.0)
      let vd = (0.0, 0.0)

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      seg(va, vb); seg(vb, vc); seg(vc, vd); seg(va, vd); seg(vb, vd)

      for p in (va, vb, vc, vd) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((-0.30, 1.8), text(size: 8.5pt)[$a$])
      draw.content((2.10,  1.8), text(size: 8.5pt)[$b$])
      draw.content((2.10,  0.0), text(size: 8.5pt)[$c$])
      draw.content((-0.30, 0.0), text(size: 8.5pt)[$d$])
    })
  ]
]

=== Types of Graphs

#definition[
  - The *complete graph* $K_n$ is the graph on $n$ vertices in which every pair of distinct vertices is joined by an edge. It has $binom(n, 2) = n(n-1)/2$ edges.

  - The *cycle* $C_n$ ($n >= 3$) is the graph with vertices $v_1, v_2, dots, v_n$ and edges $\{v_1,v_2\}, \{v_2,v_3\}, dots, \{v_{n-1},v_n\}, \{v_n,v_1\}$.

  - The *path* $P_n$ is the graph with vertices $v_1, v_2, dots, v_n$ and edges $\{v_1,v_2\}, \{v_2,v_3\}, dots, \{v_{n-1},v_n\}$.

  - A graph $G = (V, E)$ is *bipartite* if $V$ can be partitioned into two non-empty sets $X$ and $Y$ such that every edge has one endpoint in $X$ and one in $Y$. The sets $X$ and $Y$ are the *parts*.

  - The *complete bipartite graph* $K_{m,n}$ has parts $X$ ($m$ vertices) and $Y$ ($n$ vertices), with every vertex in $X$ adjacent to every vertex in $Y$, giving $m n$ edges.

  - A graph $H = (W, F)$ is a *subgraph* of $G = (V, E)$ if $W subset.eq V$ and $F subset.eq E$. If $W = V$, it is a *spanning subgraph*.
]

#example[
  $K_1$: a single vertex with no edges. $K_2$: two vertices connected by one edge. $K_3$: a triangle. $K_4$: four vertices, each pair connected, with $binom(4, 2) = 6$ edges.

  $K_{2,3}$ has parts $\{u_1, u_2\}$ and $\{v_1, v_2, v_3\}$, with $2 times 3 = 6$ edges.
]

#diagram(caption: [
  Left: the complete graph $K_3$ (triangle, 3 edges). Centre: the complete graph $K_4$
  (6 edges, every pair joined). Right: the complete bipartite graph $K_(2,3)$ with
  left part $\{u_1,u_2\}$ and right part $\{v_1,v_2,v_3\}$, giving $2 times 3 = 6$ edges.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      // ── K3: equilateral triangle ──────────────────────────────────────────
      let k3 = ((1.0, 1.82), (0.0, 0.0), (2.0, 0.0))
      seg(k3.at(0), k3.at(1)); seg(k3.at(0), k3.at(2)); seg(k3.at(1), k3.at(2))
      for p in k3 { draw.circle(p, radius: rd, fill: black, stroke: none) }
      draw.content((1.0,  2.14), text(size: 8.5pt)[$v_1$])
      draw.content((-0.32, 0.0), text(size: 8.5pt)[$v_2$])
      draw.content((2.32,  0.0), text(size: 8.5pt)[$v_3$])

      // ── K4: square with both diagonals ────────────────────────────────────
      let o4 = 4.5
      let k4 = ((o4 + 0.0, 1.8), (o4 + 1.8, 1.8), (o4 + 1.8, 0.0), (o4 + 0.0, 0.0))
      for i in range(4) {
        for j in range(i + 1, 4) { seg(k4.at(i), k4.at(j)) }
      }
      for p in k4 { draw.circle(p, radius: rd, fill: black, stroke: none) }
      draw.content((o4 - 0.32, 1.8), text(size: 8.5pt)[$v_1$])
      draw.content((o4 + 2.12, 1.8), text(size: 8.5pt)[$v_2$])
      draw.content((o4 + 2.12, 0.0), text(size: 8.5pt)[$v_3$])
      draw.content((o4 - 0.32, 0.0), text(size: 8.5pt)[$v_4$])

      // ── K_{2,3}: bipartite ────────────────────────────────────────────────
      let o5 = 9.5
      let ku = ((o5, 1.4), (o5, 0.4))
      let kv = ((o5 + 2.5, 2.0), (o5 + 2.5, 0.9), (o5 + 2.5, -0.2))
      for u in ku { for v in kv { seg(u, v) } }
      for p in ku { draw.circle(p, radius: rd, fill: black, stroke: none) }
      for p in kv { draw.circle(p, radius: rd, fill: black, stroke: none) }
      draw.content((o5 - 0.35, 1.40),  text(size: 8.5pt)[$u_1$])
      draw.content((o5 - 0.35, 0.40),  text(size: 8.5pt)[$u_2$])
      draw.content((o5 + 2.85, 2.00),  text(size: 8.5pt)[$v_1$])
      draw.content((o5 + 2.85, 0.90),  text(size: 8.5pt)[$v_2$])
      draw.content((o5 + 2.85, -0.20), text(size: 8.5pt)[$v_3$])
    })
  ]
]

#theorem[
  A graph is bipartite if and only if it contains no odd cycle.
]

=== Degree of a Vertex

#definition[
  The *degree* of a vertex $v$ in a graph $G$, written $deg(v)$, is the number of edges incident to $v$. (In a pseudograph, loops contribute 2 to the degree.) The *minimum degree* and *maximum degree* of $G$ are denoted $delta(G)$ and $Delta(G)$ respectively.
]

#theorem("Handshaking Theorem")[
  For any graph $G = (V, E)$,
  $ sum_(v in V) deg(v) = 2|E|. $
]

#proof[
  Each edge $\{u, v\}$ contributes 1 to $deg(u)$ and 1 to $deg(v)$, so contributes exactly 2 to the sum $sum_v deg(v)$. Summing over all edges gives $2|E|$.
]

#theorem[
  In any graph, the number of vertices with odd degree is even.
]

#proof[
  By the Handshaking Theorem, $sum_v deg(v) = 2|E|$, which is even. The sum of even-degree vertices is even; since the total is even, the sum of odd-degree vertices must also be even. A sum of odd numbers is even if and only if there are an even number of them.
]

#example[
  In $K_5$: each vertex has degree 4. Sum of degrees $= 5 times 4 = 20 = 2 times 10 = 2|E|$. ✓

  In $K_{3,4}$: vertices in the 3-part have degree 4; vertices in the 4-part have degree 3. Sum $= 3 times 4 + 4 times 3 = 24 = 2 times 12$, so $|E| = 12 = 3 times 4$. ✓
]

#definition[
  A graph is *regular* if every vertex has the same degree. A graph where every vertex has degree $k$ is *$k$-regular*. The complete graph $K_n$ is $(n-1)$-regular.
]

== Walks, Trails, and Circuits

Movement through a graph is formalised by the notions of walks, trails, and paths. The classical problems of Euler and Hamilton ask when a graph can be traversed in particularly structured ways.

=== Definitions and Examples

#definition[
  Let $G = (V, E)$ be a graph. A *walk* from $v_0$ to $v_n$ is a finite sequence
  $ v_0, e_1, v_1, e_2, v_2, dots, e_n, v_n $
  of alternating vertices and edges, where $e_i = \{v_{i-1}, v_i\}$ for each $i$. The *length* of the walk is $n$ (the number of edges).

  - A *trail* is a walk with no repeated edges.
  - A *path* is a walk with no repeated vertices (and hence no repeated edges).
  - A walk is *closed* if $v_0 = v_n$.
  - A *circuit* is a closed trail.
  - A *cycle* is a closed walk with no repeated vertices (other than $v_0 = v_n$) and length $n >= 3$.
]

#theorem[
  If there is a walk from $u$ to $v$ in a graph $G$, then there is a path from $u$ to $v$.
]

#proof[
  Among all walks from $u$ to $v$, choose one of minimum length. If this walk had a repeated vertex $w$ (at positions $i$ and $j$ with $i < j$), then removing the portion between the two occurrences of $w$ would yield a shorter walk — contradicting minimality. Hence the walk has no repeated vertices and is a path.
]

#definition[
  A graph $G$ is *connected* if there is a path between every pair of distinct vertices. Otherwise $G$ is *disconnected*. The maximal connected subgraphs of $G$ are its *connected components*.
]

#example[
  The cycle $C_5$ is connected. The graph consisting of $K_3$ together with an isolated vertex has two connected components.
]

=== Euler Trails and Circuits

#definition[
  A trail that traverses every edge of $G$ exactly once is an *Eulerian trail*. A closed Eulerian trail is an *Eulerian circuit*. A graph is *Eulerian* if it has an Eulerian circuit.
]

#theorem("Euler's Theorem")[
  A connected graph $G$ has an Eulerian circuit if and only if every vertex has even degree.

  A connected graph $G$ has an Eulerian trail from $u$ to $v$ (with $u != v$) if and only if $u$ and $v$ are the only vertices of odd degree.
]

#proof[
  *Necessity for circuits:* In an Eulerian circuit, every time the circuit passes through a vertex $w$, it uses one edge to enter and one to leave. Since no edge is repeated, each visit uses two previously unused edges. Hence $deg(w)$ must be even for every $w$.

  *Sufficiency for circuits:* We use Hierholzer's algorithm. Begin at any vertex $v$ and follow edges (deleting each used edge) until returning to $v$ — this is always possible when all degrees are even (since arriving at any non-start vertex always leaves an unused edge to exit). The resulting closed trail $C_1$ may not use all edges. If edges remain, some vertex $w$ on $C_1$ has unused incident edges. Start a new closed trail from $w$ using only unused edges. Splice this trail into $C_1$ at $w$. Repeat until no edges remain.

  *Eulerian trails:* Adding an edge between $u$ and $v$ in the "trail" case gives a graph where every vertex has even degree (since only $u$ and $v$ had odd degree). The resulting graph has an Eulerian circuit, which restricted to the original edges gives an Eulerian trail from $u$ to $v$.
]

#example[
  *Königsberg bridge problem (Euler, 1736):* The city of Königsberg had two islands in the Pregel river, connected to each other and to both banks by seven bridges. Modelling landmasses as vertices and bridges as edges gives a multigraph in which all four vertices have odd degree (3, 3, 3, or 5). Since there are four vertices of odd degree (not two), no Eulerian trail exists. It is impossible to walk across each bridge exactly once.
]

=== Hamilton Paths and Circuits

#definition[
  A *Hamiltonian path* in a graph $G$ is a path that visits every vertex exactly once. A *Hamiltonian circuit* is a cycle that visits every vertex exactly once and returns to the starting vertex. A graph that has a Hamiltonian circuit is called *Hamiltonian*.
]

#remark[
  Unlike Eulerian circuits, there is no known simple characterisation of Hamiltonian graphs.. The following theorems give sufficient (but not necessary) conditions.
]

#theorem("Dirac's Theorem")[
  If $G$ is a simple graph with $n >= 3$ vertices such that $deg(v) >= n\/2$ for every vertex $v$, then $G$ is Hamiltonian.
]

#theorem("Ore's Theorem")[
  If $G$ is a simple graph with $n >= 3$ vertices such that $deg(u) + deg(v) >= n$ for every pair of non-adjacent vertices $u$ and $v$, then $G$ is Hamiltonian.
]

#important[
  Determining whether a graph is Hamiltonian is an NP-complete problem. No polynomial-time algorithm is known (and the existence of one would imply P = NP). This contrasts sharply with Eulerian circuits, for which a linear-time algorithm exists. The Travelling Salesman Problem — finding a minimum-weight Hamiltonian circuit in a weighted graph — is one of the most intensively studied problems in combinatorial optimisation.
]

== Matrix Representations of Graphs

Graphs can be represented as matrices, enabling algebraic and computational techniques. Two standard representations are the adjacency matrix and the incidence matrix.

=== Adjacency Matrices

#definition[
  Let $G = (V, E)$ be a graph with vertices labelled $v_1, v_2, dots, v_n$ in some fixed order. The *adjacency matrix* of $G$ is the $n times n$ matrix $A$ where
  $ A_(i j) = cases(1 & "if" {v_i, v_j} in E, 0 & "otherwise.") $
]

#note[
  For simple undirected graphs: $A$ is symmetric ($A_(i j) = A_(j i)$) and has zeros on the diagonal ($A_(i i) = 0$). For directed graphs, $A_(i j) = 1$ if there is an arc from $v_i$ to $v_j$; $A$ need not be symmetric.
]

#theorem[
  The $(i, j)$ entry of $A^k$ equals the number of walks of length $k$ from $v_i$ to $v_j$.
]

#proof[
  By induction on $k$. For $k = 1$, $A^1 = A$ and the result holds by definition. Suppose it holds for $k - 1$. The $(i,j)$ entry of $A^k = A^(k-1) times A$ is
  $ (A^k)_(i j) = sum_(m=1)^n (A^(k-1))_(i m) A_(m j). $
  By the inductive hypothesis, $(A^(k-1))_(i m)$ counts walks of length $k-1$ from $v_i$ to $v_m$. Multiplying by $A_(m j)$ (which is 1 if $\{v_m, v_j\} in E$ and 0 otherwise) and summing counts walks of length $k$ from $v_i$ to $v_j$ via the penultimate vertex $v_m$.
]

#example[
  The adjacency matrix of $K_3$ (vertices $v_1, v_2, v_3$) is
  $ A = mat(0, 1, 1; 1, 0, 1; 1, 1, 0). $

  The row sums give the degrees: each vertex has degree 2. The matrix $A^2$ has $(i,j)$ entry equal to the number of walks of length 2 from $v_i$ to $v_j$.
  $ A^2 = mat(2, 1, 1; 1, 2, 1; 1, 1, 2). $
  The diagonal entry $(A^2)_(1 1) = 2$ counts the two walks of length 2 from $v_1$ to itself: $v_1 v_2 v_1$ and $v_1 v_3 v_1$.
]

#remark[
  The degree of vertex $v_i$ equals the sum of row $i$ of $A$: $deg(v_i) = sum_(j=1)^n A_(i j)$. This provides a quick method to read off all degrees from the adjacency matrix.
]

=== Incidence Matrices

#definition[
  Let $G = (V, E)$ be a graph with $n$ vertices $v_1, dots, v_n$ and $m$ edges $e_1, dots, e_m$ in some fixed order. The *incidence matrix* of $G$ is the $n times m$ matrix $M$ where
  $ M_(i j) = cases(1 & "if" v_i "is an endpoint of" e_j, 0 & "otherwise.") $
]

#note[
  - Each column of $M$ has exactly two 1s (one per endpoint of each edge), since every edge has exactly two endpoints in a simple graph.
  - The sum of row $i$ equals $deg(v_i)$.
  - The sum of all entries equals $2|E|$, consistent with the Handshaking Theorem.
]

#example[
  Let $G$ have vertices $\{v_1, v_2, v_3, v_4\}$ and edges $e_1 = \{v_1,v_2\}$, $e_2 = \{v_1,v_3\}$, $e_3 = \{v_2,v_4\}$, $e_4 = \{v_3,v_4\}$. The incidence matrix is:
  $
    M = mat(
      1, 1, 0, 0;
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 1, 1
    ).
  $
  Row sums: $v_1$ has degree 2, $v_2$ has degree 2, $v_3$ has degree 2, $v_4$ has degree 2. Total: $8 = 2 times 4 = 2|E|$. ✓
]

== Trees

Trees are the simplest connected graphs, and their absence of cycles gives them a particularly clean structure. They arise naturally in data structures, algorithm design, and the analysis of networks.

=== Definitions and Properties

#definition[
  A *tree* is a connected graph that contains no cycles. A graph that contains no cycles but is not necessarily connected is a *forest*; the connected components of a forest are trees.
]

#example[
  $K_1$ (single vertex), $K_2$ (single edge), the path $P_n$, and any star graph (one central vertex connected to $n$ leaves) are trees. The cycle $C_3$ is connected but not a tree (it contains a cycle).
]

#diagram(caption: [
  A tree on six vertices. Every pair of vertices is connected by exactly one path,
  and removing any single edge disconnects the graph. The tree has $6 - 1 = 5$ edges.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let v1 = (2.5, 3.0)
      let v2 = (0.8, 1.5)
      let v3 = (4.2, 1.5)
      let v4 = (0.0, 0.0)
      let v5 = (1.8, 0.0)
      let v6 = (4.2, 0.0)

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      seg(v1, v2); seg(v1, v3)
      seg(v2, v4); seg(v2, v5)
      seg(v3, v6)

      for p in (v1, v2, v3, v4, v5, v6) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((2.5,  3.30), text(size: 8.5pt)[$v_1$])
      draw.content((0.46, 1.50), text(size: 8.5pt)[$v_2$])
      draw.content((4.54, 1.50), text(size: 8.5pt)[$v_3$])
      draw.content((0.00,-0.30), text(size: 8.5pt)[$v_4$])
      draw.content((1.80,-0.30), text(size: 8.5pt)[$v_5$])
      draw.content((4.54, 0.00), text(size: 8.5pt)[$v_6$])
    })
  ]
]

#theorem[
  The following statements are equivalent for a connected graph $G$ with $n$ vertices:
  1. $G$ is a tree (connected and acyclic).
  2. $G$ is connected and has exactly $n - 1$ edges.
  3. $G$ is acyclic and has exactly $n - 1$ edges.
  4. There is exactly one path between every pair of distinct vertices.
  5. $G$ is connected, and removing any single edge disconnects $G$.
]

#proof[
  We prove $(1) arrow.r (2)$ by induction on $n$.

  *Base case* ($n = 1$): A single vertex is a tree with $0 = 1 - 1$ edges. ✓

  *Inductive step:* Suppose all trees with $n - 1$ vertices have $n - 2$ edges. Let $T$ be a tree with $n >= 2$ vertices. Since $T$ is a finite connected acyclic graph, it has at least one leaf (proved below). Remove a leaf $v$ and its incident edge. The result $T'$ is a connected acyclic graph on $n - 1$ vertices, so by the inductive hypothesis it has $n - 2$ edges. Restoring $v$ adds one edge, giving $T$ exactly $n - 1$ edges.
]

#theorem[
  Every tree with $n >= 2$ vertices has at least two leaves (vertices of degree 1).
]

#proof[
  Let $P = v_0, v_1, dots, v_k$ be a longest path in the tree. The endpoints $v_0$ and $v_k$ must be leaves: if $v_0$ had a neighbour $u$ other than $v_1$, then $u$ is not on $P$ (otherwise there would be a cycle), so $u, v_0, v_1, dots, v_k$ would be a longer path, contradicting the maximality of $P$. By the same argument, $v_k$ is a leaf. Since $k >= 1$ (any two vertices are connected by a path), $v_0 != v_k$, giving two distinct leaves.
]

=== Spanning Trees

#definition[
  A *spanning tree* of a connected graph $G$ is a subgraph that is both a spanning subgraph (containing all vertices) and a tree.
]

#theorem[
  Every connected graph has a spanning tree.
]

#proof[
  If $G$ is already a tree, we are done. Otherwise, $G$ contains a cycle; remove one edge of that cycle. The graph remains connected (the two endpoints of the removed edge are still connected via the rest of the cycle). Repeat until no cycle remains. The result is a spanning tree.
]

#definition[
  In a *weighted graph*, each edge $e$ is assigned a real number $w(e)$ called its *weight*. The *weight* of a subgraph is the sum of its edge weights. A *minimum spanning tree* (MST) of a connected weighted graph is a spanning tree of minimum total weight.
]

Minimum spanning trees have applications in network design: finding the cheapest way to connect all nodes in a network.

#theorem("Kruskal's Algorithm")[
  Sort all edges by weight in non-decreasing order. Add edges to the tree one at a time, skipping any edge that would form a cycle. Stop when $n - 1$ edges have been added. The result is a minimum spanning tree.
]

#theorem("Prim's Algorithm")[
  Start from any vertex. At each step, add the minimum-weight edge that connects a vertex already in the tree to a vertex not yet in the tree. Stop when all vertices are included. The result is a minimum spanning tree.
]

#example[
  Let $G$ have vertices $\{A, B, C, D\}$ with edge weights: $A$-$B$ = 4, $A$-$C$ = 2, $A$-$D$ = 7, $B$-$C$ = 1, $B$-$D$ = 5, $C$-$D$ = 3.

  *Kruskal:* Sort edges by weight: $B$-$C$ (1), $A$-$C$ (2), $C$-$D$ (3), $A$-$B$ (4), $B$-$D$ (5), $A$-$D$ (7). Add $B$-$C$: no cycle; add $A$-$C$: no cycle; add $C$-$D$: connects $D$ with no cycle formed. Three edges added for four vertices. Done. MST has total weight $1 + 2 + 3 = 6$.
]

#diagram(caption: [
  Left: the weighted complete graph on $\{A,B,C,D\}$ with the given edge weights.
  Right: the minimum spanning tree produced by Kruskal's algorithm, using edges
  $B$-$C$ (weight~1), $A$-$C$ (weight~2), and $C$-$D$ (weight~3), total weight~6.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw   = 0.7pt + black
      let sw-m = 1.4pt + black   // heavier stroke for MST edges

      let seg(f, t, s: sw) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: s)
      }

      // ── Complete graph (diamond layout) ───────────────────────────────────
      let nA = (0.0, 1.5)
      let nB = (1.5, 3.0)
      let nC = (3.0, 1.5)
      let nD = (1.5, 0.0)

      seg(nA, nB); seg(nA, nC); seg(nA, nD)
      seg(nB, nC); seg(nB, nD); seg(nC, nD)

      for p in (nA, nB, nC, nD) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((-0.30, 1.50), text(size: 8.5pt)[$A$])
      draw.content((1.50,  3.30), text(size: 8.5pt)[$B$])
      draw.content((3.30,  1.50), text(size: 8.5pt)[$C$])
      draw.content((1.50, -0.30), text(size: 8.5pt)[$D$])

      // edge weight labels
      draw.content((0.60, 2.40), text(size: 7.5pt)[4])   // A-B
      draw.content((1.50, 1.72), text(size: 7.5pt)[2])   // A-C
      draw.content((0.60, 0.60), text(size: 7.5pt)[7])   // A-D
      draw.content((2.40, 2.40), text(size: 7.5pt)[1])   // B-C
      draw.content((1.72, 1.50), text(size: 7.5pt)[5])   // B-D
      draw.content((2.40, 0.60), text(size: 7.5pt)[3])   // C-D

      // ── MST (same layout, x-offset = 5.5) ────────────────────────────────
      let ox = 5.5
      let mA = (ox + 0.0, 1.5)
      let mB = (ox + 1.5, 3.0)
      let mC = (ox + 3.0, 1.5)
      let mD = (ox + 1.5, 0.0)

      seg(mB, mC, s: sw-m)   // weight 1
      seg(mA, mC, s: sw-m)   // weight 2
      seg(mC, mD, s: sw-m)   // weight 3

      for p in (mA, mB, mC, mD) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((ox - 0.30, 1.50), text(size: 8.5pt)[$A$])
      draw.content((ox + 1.50, 3.30), text(size: 8.5pt)[$B$])
      draw.content((ox + 3.30, 1.50), text(size: 8.5pt)[$C$])
      draw.content((ox + 1.50,-0.30), text(size: 8.5pt)[$D$])

      draw.content((ox + 2.40, 2.40), text(size: 7.5pt)[1])   // B-C
      draw.content((ox + 1.50, 1.72), text(size: 7.5pt)[2])   // A-C
      draw.content((ox + 2.40, 0.60), text(size: 7.5pt)[3])   // C-D
    })
  ]
]

=== Rooted Trees

#definition[
  A *rooted tree* is a tree in which one vertex has been designated as the *root*. The root induces a natural hierarchy: for each vertex $v != r$ (root), the unique path from the root to $v$ passes through the *parent* of $v$. The vertex $v$ is then a *child* of its parent. Vertices with no children are *leaves*; all other non-root vertices are *internal vertices*.
]

#definition[
  In a rooted tree:
  - The *level* of a vertex $v$ is the length of the path from the root to $v$. The root has level 0.
  - The *height* of the tree is the maximum level of any vertex.
  - The *subtree rooted at $v$* consists of $v$ and all its descendants.
  - Two vertices with the same parent are *siblings*.
]

#example[
  A rooted tree with root $r$, children $a$ and $b$, and $a$ having children $c$ and $d$:
  - Level 0: $r$
  - Level 1: $a$, $b$
  - Level 2: $c$, $d$
  - Leaves: $b$, $c$, $d$; internal vertices: $r$, $a$; height: 2.
]

#diagram(caption: [
  The rooted tree from the example. Root $r$ is at level~0; vertices $a$ and $b$
  are at level~1; vertices $c$ and $d$ are at level~2. Leaves are $b$, $c$, $d$;
  the internal vertices are $r$ and $a$; height is~2.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let vr = (2.0, 3.0)
      let va = (1.0, 1.5)
      let vb = (3.0, 1.5)
      let vc = (0.2, 0.0)
      let vd = (1.8, 0.0)

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      seg(vr, va); seg(vr, vb)
      seg(va, vc); seg(va, vd)

      for p in (vr, va, vb, vc, vd) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((2.0,  3.30), text(size: 8.5pt)[$r$])
      draw.content((0.65, 1.50), text(size: 8.5pt)[$a$])
      draw.content((3.35, 1.50), text(size: 8.5pt)[$b$])
      draw.content((0.20,-0.30), text(size: 8.5pt)[$c$])
      draw.content((1.80,-0.30), text(size: 8.5pt)[$d$])
    })
  ]
]

#definition[
  A rooted tree is a *binary tree* if every internal vertex has at most two children (a *left child* and a *right child*). A binary tree is *full* if every internal vertex has exactly two children. A *complete binary tree* has all levels fully populated except possibly the last, which is filled from left to right.
]

#theorem[
  A full binary tree with $k$ internal vertices has $k + 1$ leaves and $2k + 1$ vertices in total.
]

#proof[
  By induction on $k$. For $k = 0$: a single root (which is a leaf), giving 1 leaf and 1 vertex. ✓ For the inductive step, suppose the result holds for all full binary trees with fewer than $k$ internal vertices. Let $T$ be a full binary tree with $k >= 1$ internal vertices. The root has exactly two children; removing the root produces two full binary trees $T_1$ and $T_2$ with $k_1$ and $k_2$ internal vertices where $k_1 + k_2 = k - 1$. By the inductive hypothesis, $T_1$ has $k_1 + 1$ leaves and $T_2$ has $k_2 + 1$ leaves. Restoring the root: the root is internal (not a leaf), so $T$ has $(k_1 + 1) + (k_2 + 1) = k_1 + k_2 + 2 = (k-1) + 2 = k + 1$ leaves, and $2k_1 + 1 + 2k_2 + 1 + 1 = 2(k-1) + 3 = 2k + 1$ total vertices.
]

#diagram(caption: [
  A full binary tree with $k = 3$ internal vertices ($r$, $a$, $b$) and
  $k + 1 = 4$ leaves ($c$, $d$, $e$, $f$), giving $2k + 1 = 7$ vertices in total.
  Every internal vertex has exactly two children.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let vr = (3.0, 3.0)
      let va = (1.5, 1.8)
      let vb = (4.5, 1.8)
      let vc = (0.6, 0.6)
      let vd = (2.4, 0.6)
      let ve = (3.6, 0.6)
      let vf = (5.4, 0.6)

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      seg(vr, va); seg(vr, vb)
      seg(va, vc); seg(va, vd)
      seg(vb, ve); seg(vb, vf)

      for p in (vr, va, vb, vc, vd, ve, vf) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((3.0,  3.30), text(size: 8.5pt)[$r$])
      draw.content((1.18, 1.80), text(size: 8.5pt)[$a$])
      draw.content((4.82, 1.80), text(size: 8.5pt)[$b$])
      draw.content((0.60, 0.30), text(size: 8.5pt)[$c$])
      draw.content((2.40, 0.30), text(size: 8.5pt)[$d$])
      draw.content((3.60, 0.30), text(size: 8.5pt)[$e$])
      draw.content((5.40, 0.30), text(size: 8.5pt)[$f$])
    })
  ]
]

#remark[
  Binary trees appear throughout computer science. Binary search trees support efficient searching, insertion, and deletion in $O(log n)$ time when balanced. Heaps, used in priority queues and Dijkstra's algorithm, are often implemented as complete binary trees stored in arrays. Expression trees represent arithmetic expressions with operators at internal nodes and operands at leaves.
]
