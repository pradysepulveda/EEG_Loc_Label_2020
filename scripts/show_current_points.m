function []= show_current_points(label_matrix,surface_info)
%%Show current electrode_matrix on the head surface

% Input:
% surface_info: struct with head mask matrix info from Brainstorm.
% label_matrix: matrix containing electrode (rows) and 3d coodinates
% (columns).


% P Sepulveda -- 2019

face = surface_info.Faces;
nodes = surface_info.Vertices;
curvature=surface_info.Curvature;


figure
patch('faces',face,'vertices',nodes,'CData',curvature,'EdgeColor','interp','FaceAlpha',.6);
hold on;
plot3(label_matrix(:,1),label_matrix(:,2),label_matrix(:,3),'.r','LineWidth',15000,'MarkerSize',50);
daspect([1 1 1]);
axis off;