function [label_matrix]= new_points(label_matrix,surface_info)
% Select points to add to the electrode list in the head model
% It uses data cursor functionality in MATLAB figure. 

% Input:
% surface_info: struct with head mask matrix info from Brainstorm.
% label_matrix: matrix containing electrode (rows) and 3d coodinates
% (columns).

% Output:
% label_matrix : matrix containing positions of potential electrodes 

% Select the points to delete using data cursor feature  (available in the
% MATLAB figure window; keep ALT, in windows, pressed to select more than one)


%%Selecciona los puntos que quieras agregar usando data cursor en la imagen
%%(click +ALT en Windows ) y guardarlo a una variable en el workspace (cursor_info)

% P Sepulveda -- 2019


face = surface_info.Faces;
nodes = surface_info.Vertices;
curvature=surface_info.Curvature;

% Select the dots to add using the data_cursor functionality
disp('Indicate points to ADD')
[cursor_info]=visualize(face,nodes,curvature,label_matrix,50)

largo_agrega=length(cursor_info);
largo_labels=length(label_matrix);


for j=1: largo_agrega

    label_matrix(largo_labels+j,:)= cursor_info(1,j).Position; 
    
end

figure
patch('faces',face,'vertices',nodes,'CData',curvature,'EdgeColor','interp','FaceAlpha',.1);
hold on;
plot3(label_matrix(:,1),label_matrix(:,2),label_matrix(:,3),'.r','LineWidth',15000,'MarkerSize',50);
daspect([1 1 1]);
axis off;