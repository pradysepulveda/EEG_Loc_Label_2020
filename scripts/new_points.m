function [label_matrix]= new_points(label_matrix,surface_info)
% Select points to add to the electrode list in the head model

%%Selecciona los puntos que quieras agreagar usando data cursor en la imagen
%%(+ALT) y guardarlo a una variable en el workspace (cursor_info)


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