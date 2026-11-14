#import "preamble.typ": *
#show: mat149-slides.with([Unit 10: Applications of the Integral])

// Ported from the MAT137 class slides, unit 10 (2022-2023-MAT137/unit-10/137-CA-10.tex).
// Covers video 10.2: volumes by slicing and by cylindrical shells.

// ---------------------------------------------------------------------------
// Volumes
// ---------------------------------------------------------------------------

#lecture([Volumes 1], videos: ("10.2",))

#exercise(title: [Sphere], num_prefix: auto)[
  You know the formula for the volume of a sphere with radius $R$. Now you are able to prove it!

  + Write an equation for the circle with radius $R$ centered at $(0, 0)$.
  + If you rotate this circle around the $x$-axis, it will produce a sphere. Compute its volume as
    an integral by slicing it like a carrot.
]

#exercise(title: [Pyramid], num_prefix: auto)[
  Compute the volume of a pyramid with height $H$ and square base with side length $L$.

  _Hint:_ Slice the pyramid like a carrot with cuts parallel to the base.
]

#exercise(title: [Many Axes of Rotation], num_prefix: auto)[
  Let $R$ be the region in the first quadrant bounded between the curves with equations $y = x^3$
  and $y = sqrt(32 x)$. Compute the volume of the solid of revolution obtained by rotating $R$
  around...

  + ... the $x$-axis
  + ... the $y$-axis
  + ... the line $y = -1$
]

#lecture([Volumes 2], videos: ("11.1", "11.2"))

#exercise(title: [Doughnut], num_prefix: auto)[
  Let $R$ be the region inside the curve with equation
  $
    (x - 1)^2 + y^2 = 1.
  $
  Rotate $R$ around the line with equation $x = 4$. The resulting solid is called a _torus_.

  + Draw a picture and convince yourself that a torus looks like a doughnut.
  + Set up the volume of the torus as an integral using $x$ as the variable ("cylindrical shell
    method"). You do not need to compute the integral.
  + Set up the volume of the torus as an integral using $y$ as the variable ("carrot method"). You
    do not need to compute the integral.
]

#exercise(title: [Challenge], num_prefix: auto)[
  Two cylinders have the same radius $R$ and their axes are perpendicular. Find the volume of
  their intersection.

  _Hint:_ You can slice the resulting solid by parallel cuts in three different directions. One of
  the three makes the problem much, much simpler than the other two.
]
