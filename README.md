# EEG_Loc_Label_2020
Scripts and example datasets from Bhutada, Sepulveda et al. (2020) Frontiers in Neural Technology.


Scripts relevant to run the algorithm

electrode_loc_fMRI.m: takes the brain model (containing curvature info from Freesurfer/BrainStorm) and generates a matrix with the electrodes locations (“label_matrix”). Lists all the potential electrodes. It could be more than 64

** Recall that there is a manual step to take out extra electrodes (manual pruning to leave only 64 electrodes among all the located)**

algorithm_only.m : contains the distance profile labelling algorithm

all_subjects_labels_vectors.m: uses algorithm_only.m over the data of all the subjects available. In the case we have 3 layers, it also calculates the new_voted_matrix


electrode_location_analysis_recalc.m: LOCATION ANALYSIS STEP. checks the potential electrodes picked to generate the “label_matrix” t(i.e. label_matrix containing the electrode locations NOT labels) and compares to gold standard (“positionsf”) from manual check of positioning of the electrodes. Allows to calculate True positives and False positives for positioning.



License
This code is being released with a permissive open-source license. You should feel free to use or adapt the utility code as long as you follow the terms of the license, which are enumerated below. If you use the toolbox in a publication we ask that you cite the following paper:


Copyright (c) 2020, Bhutada, Sepulveda, Torres , Ossandon , Sitaram and Ruiz.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.