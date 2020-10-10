function [correct_labels,d_sort]=distProf_algorithm(positions_path,label_matrix_erased)
% Labeling of electrode from a list with known positions


% Input:
% positions: template electrode positioning. Check examples in 'electrodeTemplates' folder (https://github.com/pradysepulveda/EEG_Loc_Label_2020/tree/main/data/electrodesTemplates).
%           path to the text file containing electrode template info can be
%           written (e.g. /test.xyz)
% label_matrix_erased: non-labeled electrodes (64) obtained from the
% localization stage. (NOTICE: THIS MATRIX SHOULD HAVE ONLY 64 ROWS, since only 64 pairs have been defined. Modify list_paits if used with templates with a different number of electrodes). 

% Output:
% correct_labels : ordered electrode list (by label). Label sequence corresponds to  
% 1     2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	36	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64
% FP1	FPZ	FP2	AF3	AF4	F7	F5	F3	F1	FZ	F2	F4	F6	F8	FT7	FC5	FC3	FC1	FCZ	FC2	FC4	FC6	FT8	M1	T7	C5	C3	C1	CZ	C2	C4	C6	T8	M2	TP7	CP3	CP5	CP1	CPZ	CP2	CP4	CP6	TP8	P7	P5	P3	P1	PZ	P2	P4	P6	P8	PO7	PO5	PO3	POZ	PO4	PO6	PO8	O1	OZ	O2	I1	I2

% * For 'positions' the format for each row (electrode information) is :
%  [ n ; x_coord ; y_coord ; z_coord ]
% ** For 'label_matrix_erased'  the format for each row (electrode information) is :
%  [ x_coord ; y_coord ; z_coord ]
%  with n: electrode number (1:64) and x_coord,y_coord and z_coord the 3D
%  coordinates
% P Sepulveda -- 2019



% Define electrodes matrix
% Load XYZ electrode file if string (in case position is input as filename
n_electrodes = length(label_matrix_erased(:,1));

if ischar(positions_path) 
    a = fopen(positions_path);
    b = textscan(a, '%f %f %f %f %s', 'delimiter', ' ', 'CollectOutput',true);
    position = zeros(n_electrodes,3);
    
    for n=1:length(position);
        position(n,:) = b{1,1}(n,2:4);
    end
% If it is not a string then load as matrix directly
else
    if length(positions_path(1,:))==4
        position = positions_path(:,2:4);
    else
        position = positions_path;
    end
end

% calculate distance profile for the template
% d_sort corresponds to the distance profile for the electrodes in the properly labelled cap

for i=1:n_electrodes
    Q1 = position(i,:);
    for j=1:n_electrodes
        Q2 = position(j,:);
        d(i,j) = norm(Q1-Q2);
    end
end
for i=1:n_electrodes
    d_sort(:,i)=sort(d(:,i),'descend');
end

% d_new considers the distance profile for the electrodes not labelled (new electrode)
for i=1:n_electrodes
    Q1 = label_matrix_erased(i,1:3);
    for j=1:n_electrodes%64
        Q2 = label_matrix_erased(j,1:3);
        d_new(i,j) = norm(Q1-Q2);
    end
end

for i=1:n_electrodes
    d_sort_new(:,i)=sort(d_new(:,i),'descend');
end


% calculate the correlations between the distance profiles of the new
% electrode(d_sort_new) and the template (d_sort)
for i=1:n_electrodes
    high_corr=0;
    pos_high_corr=0;
    for j=1:n_electrodes%64
        check=corr([d_sort(:,j),d_sort_new(:,i)]);
        curr_corr=check(1,2);
        % check which electrode in the template has the higher correlation
        % with the new electrode
        if high_corr<curr_corr
            high_corr=curr_corr;
            pos_high_corr=j;
        end
    end
    % save in pos_good the correct label of each "new electrode"
    pos_good(i)=pos_high_corr;
end

% LIST PAIRS DEFINED FOR 64 ELECTRODES
% electrode identified as symmetric pairs ( this is considering the
% electrode order stated in 64 electrode templates, check 'electrodeTemplates' folder to see details of the order)
list_pairs=[1,3;4,5;6,14;7,13;8,12;9,11;15,23;16,22;17,21;18,20;25,33;26,32;27,31;
    28,30;24,34;35,43;36,42;37,41;38,40;44,52;45,51;46,50;47,49;53,59;54,58;55,57;60,62;63,64];

% list_central=[2;10;19;29;39;46;56;61]

% initialize matrix for correct labels
correct_labels=zeros(n_electrodes,3);

for i=1:n_electrodes
    % if only one pos_good electrode is found with a label, then assign to
    % the correct_labels matrix
    if length(pos_good(pos_good==i))== 1
        I=find(pos_good==i);
        correct_labels(i,:) = (label_matrix_erased(I(1),:));
    end
end

% Identify FPZ (61) and CZ (2) electrodes
position_2 = [];
position_1 = [];
for i=1:n_electrodes
    if 61 == pos_good(i)
        position_2=i;
        %elseif 61 == pos_good(i)
        %    position_2=i;
    end
    if 2 == pos_good(i)
        position_1=i;
        %elseif 61 == pos_good(i)
        %    position_2=i;
    end
end


if isempty(position_1) | isempty(position_2)
    display ('No FPZ or CZ was found. No center line generated. WRONG results')
end

% draw the center line with those two electrodes
y_center=mean([label_matrix_erased(position_1,2),label_matrix_erased(position_2,2)]);

% identify if the electrode is at the right or left of the middle line. If
% it's right maintain, if not flip.
for i=1:n_electrodes
    if correct_labels(i,2)> y_center
        [row,col]=find(list_pairs==i);
        curr_pair= list_pairs(row,:);
        
        if col==1
            continue
        end
        if col==2
            correct_labels(curr_pair(1),:) = (correct_labels(i,:));
            correct_labels(i,:)=[0 0 0];
        end
    end
end

% separate electrodes if they have duplicated labels (==2). Assuming they
% correspond to a symmetrix pair.
for i=1:n_electrodes
    if length(pos_good(pos_good==i))== 2
        [I]=find(pos_good==i);
        [row,col]=find(list_pairs==i);
        curr_pair= list_pairs(row,:);
        if isempty(row)
            continue
        end
        if label_matrix_erased(I(1),2)>label_matrix_erased(I(2),2)
            correct_labels(curr_pair(1),:) = (label_matrix_erased(I(1),:));
            correct_labels(curr_pair(2),:) = (label_matrix_erased(I(2),:));
        else
            correct_labels(curr_pair(2),:) = (label_matrix_erased(I(1),:));
            correct_labels(curr_pair(1),:) = (label_matrix_erased(I(2),:));
        end
    end
end

% If a electrode label is repeated more than 2 times it is not added to correct labels.



