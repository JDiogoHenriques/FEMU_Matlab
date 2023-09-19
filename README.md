# FEMU_Matlab
MATLAB code for using the Finite Element Model Updating technique for identifying material parameters using ANSYS with the option of using synthetic image generation through MatchID.

## Features
- Experimental data processing.
- Smoothing of the experimental boundary conditions for its usage on the finite element model.
- Parameter identification using the Nelder-Mead optimisation technique.
- Generation of synthetic images from the numerical data (Optional).
- Option to use 1 or multiple test configurations on the identification procedure.

## Installation

1. Clone this repository.
2. Download the following dataset for a working example: https://uapt33090-my.sharepoint.com/:f:/g/personal/joaodiogofh_ua_pt/EleubBYTDUJHrlG0Uy0WD9YB6eyiSsHPCKdxl3rpBi-wzw?e=ZumNcM
3. Put the folder inside the A00 and overwrite the contents of the preexisting folder.
4. Run the code running "MesoFE.m".

## Usage
1. Update the paths of the "*.m" and ANSYS files to your local machine paths.
2. Create the CAD geometry of your study case and export using an "*.iges" file.
3. Update the Finite Element Model to your specific case.
4. Make sure the experimental data is in the correct data format as shown in the provided example. It can be done by creating a "*.mat" file by running the script "MatchID2mat.m".
5. Run the MesoFE.m code, it does the pre-processing of the experimental, smoothing of the boundary conditions and prepares the data 
6. The identification procedure is then run by running the "FEMU.m" script if doing the identification with a single test configuration or the "FEMU_mult_Stages.m" if doing the identification with multiple stages
