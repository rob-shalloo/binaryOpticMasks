# binaryOpticMasks
Given a set of axicon or axilens parameters, this suite of codes will follow a number of steps to produce GDS drawings of the masks which would be required to produce such a binary optic

Operations performed
    Calculation of required phase profile
    Wrapping of phase profile around a pi shift in the optical path
    Conversion of this phase profile to a discrete set of levels
    Generation of required masks to be produced to etch this profile
    Conversion of these masks to GDSII format, suitable for photolithography gurus!
    

#How to use?
Every runs from the OpticParams.m file
Set the required parameters and simply run from there
Several plots will pop up showing the phase profile and its conversion to a series of masks
A GDS file will be produced and saved to the local directory

