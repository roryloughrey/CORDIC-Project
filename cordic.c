/*
* cordic.c
* 
* Authors: Brian Bulfin (16157516, Rory Loughrey (16178041), Micheal O'Connor (16188713)
*
* C program to implements “2.16” fixed-point CORDIC
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define PI 3.14159265359
#define S_F 65536.0			// Scaling factor 2^16

int main() {
	double theta = 0; // User-input angle
	int theta_int;    // Integer equivalent
	int A = 0;        // Current "best guess" angle
	
	/* Pre-computed angles, arctan(2^0) -> arctan(2^-16), added and subtracted
	   to A to approximate the user input angle theta.
	   Multiplied by 2^16 in order to work with integers. */
	int a0[17] = { 51472, 30386, 16055, 8150, 4091, 2047, 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1};
	
	/* cos & sin initial values: cos = 1 & sin = 0 w/o scaling factor K. */
	int cosine = 39797; // cos = K * 2^16 = 0.60725... * 65,536 = 39797
	int sine = 0;
	
	/* Previous cos and sin values, bit-shifted to calculate current values. */
	int cos_old = 39797;
	int sin_old = 0;

	int i; // Counter

	/* Read user input angle and store in variable theta. */
	printf("Enter angle (in radians):     \n"); 
	scanf("%lf", &theta);
	
	/* Ensure theta is in range pi/2 -> -pi/2. */
	while(theta > PI/2 || theta < -(PI/2)){
		printf("Enter angle in range pi/2 -> -pi/2 rads:     \n");
		scanf("%lf", &theta);
	}
	
	theta_int = roundf(theta*S_F); // Convert theta to integer and round

	/* Set number of iterations i to desired accuracy
	   Found error to be minimized at 8 iterations */
	for (i = 0; i < 8; i++) {   
		cos_old = cosine; sin_old = sine; // Store current values before updating

		/* If current guess A is too small, add current index of a0 and
		   update cos and sin accordingly. Otherwise, if A is too big, subtract
		   current index of a0 from A and update cos & sin. */
		if (A < theta_int) {
			A += a0[i];				 // A too small
			
			cosine -= (sin_old >> (i)); /* Subtract previous sin value from cos, 
										shifted i bits to the right. */
			sine += (cos_old >> (i)); // Add previous cos value to sin.
										
		}
		else {
			A -= a0[i];				 // A too big
		
			cosine += (sin_old >> (i)); // Add previous sin value to cos.
			
			sine -= (cos_old >> (i)); // Subtract previous cos value from sin.
										
		}
		
		/* Print values to the console for each iteration, in decimal form 
		   so as to be human readable. */
		printf("==/ Iteration %d /==\n", (i+1));
		printf("A: %f\ncos: %f  err:%f\nsin: %f  err:%f\n\n", A/S_F, cosine/S_F, cos(A/S_F)-(cosine/S_F), sine/S_F, sin(A/S_F)-(sine/S_F));
	}
	
	return(0);
}