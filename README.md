# Rotational-diffusion-rigid-spherical-viruses-DPD
Vector rotational displacement for small angles was calculated to obtain the rotational diffusion of a rigid spherical virus.  The rigid virus has peplomers. 
For each simulation, we obtain the positions of the particles for 1000 dump on timesteps (large files). For improved statistical accuracy over time, the simulation was run for 10,000,000 timesteps with a timestep of 0.03 (total simulated time: 300,000). The MSAD is calculated, and once its time dependence exhibits a clear linear regime in a time interval 7X10^{3} - 3 X10^{4}.
The unwrapped positions of the particles are entered into the box simulation. Then, the new positions are located with the correct center of mass (important).
We calculated the components of the vector rotational displacement for small angles over time intervals to calculate the unbounded mean-square angular displacement. (Rotational diffusion coefficient was the result for different Pe). 
