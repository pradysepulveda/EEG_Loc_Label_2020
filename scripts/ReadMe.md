{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue-Bold;\f2\fnil\fcharset0 HelveticaNeue;
}
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;\red255\green255\blue255;\red10\green77\blue204;
}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;\cssrgb\c100000\c100000\c100000;\cssrgb\c1176\c40000\c83922;
}
\margl1440\margr1440\vieww15740\viewh14000\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Scripts relevant to run the algorithm\
\
electrode_loc_fMRI.m: takes the brain model (containing curvature info from Freesurfer/BrainStorm) and generates a matrix with the electrodes locations (\'93label_matrix\'94). Lists all the potential electrodes. It could be more than 64\
\
** Recall that there is a manual step to take out extra electrodes (manual pruning to leave only 64 electrodes among all the located)**\
\
algorithm_only.m : contains the distance profile labelling algorithm\
\
all_subjects_labels_vectors.m: uses algorithm_only.m over the data of all the subjects available. In the case we have 3 layers, it also calculates the new_voted_matrix\
\
\
electrode_location_analysis_recalc.m: LOCATION ANALYSIS STEP. checks the potential electrodes picked to generate the \'93label_matrix\'94 t(i.e. label_matrix containing the electrode locations NOT labels) and compares to gold standard (\'93positionsf\'94) from manual check of positioning of the electrodes. Allows to calculate True positives and False positives for positioning.\
\
\
\
\pard\pardeftab720\partightenfactor0

\f1\b\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
License
\f2\b0 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 This code is being released with a permissive open-source license. You should feel free to use or adapt the utility code as long as you follow the terms of the license, which are enumerated below. If you use the toolbox in a publication we ask that you cite the following paper:\cb1 \
\cb3 \
\
Fleming, S.M. (2017) HMeta-d: hierarchical Bayesian estimation of metacognitive efficiency from confidence ratings, Neuroscience of Consciousness, 3(1) nix007, {\field{\*\fldinst{HYPERLINK "https://doi.org/10.1093/nc/nix007"}}{\fldrslt \cf4 https://doi.org/10.1093/nc/nix007}}\cb1 \
\cb3 Copyright (c) 2017, Stephen Fleming\cb1 \
\cb3 \
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\cb1 \
\cb3 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\cb1 \
\cb3 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.}