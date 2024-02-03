import numpy as np
import matplotlib.pyplot as plt

def main(): 
    num_points = 2**np.arange(1,21)
    errors = np.zeros(20)

    #generate approximation errors
    for i, N in enumerate(num_points):
        #generate points
        points = np.random.uniform(-1, 1, size=(N, 2))

        #check if points are inside the unit circle
        inside = np.sum(points**2, axis=1) <= 1
        count = np.count_nonzero(inside)

        #estimate pi
        pi = 4 * (count/N)

        #calculate approximation error
        error = abs(np.pi-pi)
        errors[i] = error

    fig, ax = plt.subplots(1, 1, figsize=(10, 6))
    ax.plot(num_points, errors, color='#AA0000', linestyle='dashed', marker='o')
    ax.set_xlabel('Total Number of Points', fontsize=16)
    ax.set_ylabel('Approximation Error', fontsize=16)
    ax.set_title('PI Estimation', fontsize=20)
    ax.grid(alpha=0.2)
  
if __name__=="__main__": 
    main()