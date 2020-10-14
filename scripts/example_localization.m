%example localization
clear all
load('/Users/pradyumna/Documents/GiTs/EEG_Loc_Label_2020/data/surfaceInfo/template1_surfaceInfoAdj.mat')
%electrode_loc_fMRI(surface_info)


% example located electrodes
positions_path = '/Users/pradyumna/Documents/GiTs/EEG_Loc_Label_2020/data/electrodesTemplates/template1.xyz'
n_electrodes = 64

    a = fopen(positions_path);
    b = textscan(a, '%f %f %f %f %s', 'delimiter', ' ', 'CollectOutput',true);
    position = zeros(n_electrodes,3);
    
    for n=1:length(position);
        position(n,:) = b{1,1}(n,2:4);
    end

%[surface_adj]= surface_coord_adj(surface_info)
show_current_points(position,surface_info)
%show_current_points(position,surface_adj)


%surface_info = surface_adj
%save('template26_surfaceInfoAdj','surface_info')