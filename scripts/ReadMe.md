MATLAB scripts for localization and labelling:

<b>electrode_loc_fMRI.m</b>: electrode localization script. Receives as input the 3d brain surface structure (from Brainstorm (Tadel et al., (2011)) and generates a matrix with the electrodes locations (“label_matrix”).

<b>distProf_algorithm.m</b> :  distance profile labelling algorithm script. Receives as inputs EEG electrodes template and unlabelled list of electrodes (64 electrodes implemented). 


** Manual step to take out/ add extra electrodes locations**

<b>erase_points</b> :  indicate points on head surface and eliminate them from 'label_matrix'.
<b>new_points</b> : indicates points on head surface and add them to 'label_matrix' 
<b>show_current_points</b> : display current 'label_matrix' electrodes and display them on head surface.



References:
Tadel F, Baillet S, Mosher JC, Pantazis D, Leahy RM (2011)
Brainstorm: A User-Friendly Application for MEG/EEG Analysis
Computational Intelligence and Neuroscience, vol. 2011, ID 879716 


-----------

License
This code is being released with a permissive open-source license. You should feel free to use or adapt the utility code as long as you follow the terms of the license, which are enumerated below. If you use the toolbox in a publication we ask that you cite the following paper:


Bhutada, Sepulveda, Torres, Ossandon, Ruiz, Sitaram (2020) Semi-automated and direct localization and labeling of EEG electrodes using MR structural images for simultaneous fMRI-EEG. Front. Neurosci. doi: 10.3389/fnins.2020.558981 

Copyright (c) 2020, Bhutada, Sepulveda, Torres , Ossandon , Sitaram and Ruiz.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.