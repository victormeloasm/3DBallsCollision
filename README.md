# 3D Sphere Collision Simulation

This is a MATLAB simulation that creates an interactive animation of three spheres in a three-dimensional space. The spheres have different velocities and colors, and the simulation showcases their trajectories, collisions, and interactions in a virtual environment.

![Animação de Colisão de Esferas](sphere_collision_animation.gif)


## Requirements

Make sure you have MATLAB installed on your system before running this simulation.

## Execution

1. Clone or download this repository to your local machine.

2. Open MATLAB and navigate to the directory where the simulation files are located.

3. Open the `SphereCollision3D.m` file in MATLAB.

4. Run the script. You will see a pop-up animation window displaying the spheres interacting in a 3D environment.

## Simulation Details

### Initial Parameters

The code defines some global initial variables:

- `width`, `scene_height`, and `depth`: Dimensions of the 3D space.
- `pos`, `pos2`, and `pos3`: Initial positions of the three spheres.
- `vel`, `vel2`, and `vel3`: Initial velocities of the spheres.
- `radius`: Radius of the spheres.
- `color1`, `color2`, and `color3`: Colors of the spheres.

### Animation

The animation is created using the `draw_spheres_3D()` function. It utilizes a loop that updates the position of the spheres based on their velocities and handles collisions with the walls of the space. The updated positions are used to render the spheres in their new positions in each frame.

### Collisions

Collision detection is performed through distance checks between the spheres. If the distance between two spheres is less than twice the radius, a collision is registered. This is done for all possible combinations of spheres.

### Video Generation

The code generates a video file named `sphere_collision_animation.mp4`. This video file captures the entire animation of the simulation, including the collisions and interactions between the spheres.

## Custom Configuration

If you want to customize the simulation, you can adjust the following parameters in the code:

- `width`, `scene_height`, and `depth` to scale the 3D space.
- `vel`, `vel2`, and `vel3` to change the velocities of the spheres.
- `radius` to set the size of the spheres.
- `color1`, `color2`, and `color3` to choose the colors of the spheres.

## Disclaimer

This simulation is designed for educational and demonstration purposes. Physical accuracy may not be strict. Use it to experiment and learn basic concepts of simulations in MATLAB.

## Author

Víctor Duarte Melo

## License

This project is licensed under the MIT License. Refer to the `LICENSE` file for more details.

---

Feel free to add or modify sections as needed. This `readme.md` guide will provide a comprehensive overview of the simulation and the underlying code for users visiting your GitHub repository.
