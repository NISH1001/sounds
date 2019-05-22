#!/usr/bin/env python3

import matplotlib.pyplot as plt
plt.style.use('dark_background')

from panim.lsystem import (
    LSystemAnimator,
    BranchedLSystemAnimator
)
from panim.transformers import ZoomTransformer

def generate():
    n = 75
    angle = 22.5
    axiom = 'F'
    rule = {
        'F': ' FF+[+F-F-F]-[-F+F+F]'
    }
    iteration = 5

    animator = BranchedLSystemAnimator(
        interval=5,
        iteration=iteration,
        rule=rule,
        axiom=axiom,
        turn_angle=angle,
        start_position=(0, -20),
        nlimit=40
    )

    zoomer = ZoomTransformer(
        animobj=animator,
        factor=2000,
        nlimit=n)
    zoomer.animate(len(animator.coords))
    zoomer.save("image/fractal-tree.mp4")


def main():
    generate()

if __name__ == "__main__":
    main()
