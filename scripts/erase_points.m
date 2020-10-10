function [label_matrix]= erase_points(label_matrix,surface_info)
% Select points to erase from the electrode list in the head model


%%Selecciona los puntos que quieras eliminar usando data cursor en la imagen
%%(+ALT) y guardarlo a una variable en el workspace (cursor_info)

% Select the points to delete using data cursor feature  (available in the
% MATLAB figure window; keep ALT pressed to select more than one)


% load head model info
face = surface_info.Faces;
nodes = surface_info.Vertices;
curvature=surface_info.Curvature;

% indicate points to delete
disp('Indicate points to ERASE')
[cursor_info]=visualize(face,nodes,curvature,label_matrix,100);

largo_elim=length(cursor_info);
largo_labels=length(label_matrix);


ind_2_erase =[]
jj=1;


% erase from the matrix (label_matrix) if identical
for j=1:largo_labels
for i=1:largo_elim
 
    if sum(label_matrix(j,:)==cursor_info(1,i).Position)==3 % se elimina si es identico
        ind_2_erase(jj)=j;
        jj=jj+1;
    end
end
end
  
label_matrix(ind_2_erase,:)=[];

jj=1;
ind_2_erase2=[];

% Elimination treshold
el_tresh = 0.023;

%Erase close points (repeated points)
for i=1:length(label_matrix)
    if  sum(i==ind_2_erase2)==1 
        continue;
    end
    for j=i:length(label_matrix)
        if i==j
            continue;
        end
        if (abs(label_matrix(i,1)-label_matrix(j,1))<el_tresh) && (abs(label_matrix(i,2)-label_matrix(j,2))<el_tresh) && (abs(label_matrix(i,3)-label_matrix(j,3))<el_tresh)
           ind_2_erase2(jj)=j;
           jj=jj+1;
        end
    end
end
            
label_matrix(ind_2_erase2,:)=[];

% Show head model without the ereased electrodes.

figure
patch('faces',face,'vertices',nodes,'CData',curvature,'EdgeColor','interp','FaceAlpha',.1);
hold on;
plot3(label_matrix(:,1),label_matrix(:,2),label_matrix(:,3),'.r','LineWidth',15000,'MarkerSize',100);
daspect([1 1 1]);
%axis off;

