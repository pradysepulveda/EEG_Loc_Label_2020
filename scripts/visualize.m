
function [cursor_info]=visualize(face,nodes,curvature,label_matrix,markerSize)

% help selecting points from MATLAB figures

% P Sepulveda -- 2019


if (~exist('markerSize', 'var'))
        markerSize = 50;
end

%show figure
fig = figure
patch('faces',face,'vertices',nodes,'CData',curvature,'EdgeColor','interp','FaceAlpha',1);
daspect([1 1 1]);
hold on;
plot3(label_matrix(:,1),label_matrix(:,2),label_matrix(:,3),'.r','LineWidth',500,'MarkerSize',markerSize);
daspect([1 1 1]);
%axis off;

%load cursor mode
dcm_obj = datacursormode(fig);
set(dcm_obj,'DisplayStyle','datatip',...
'SnapToDataVertex','off','Enable','on');
% Set update function
set(dcm_obj,'UpdateFcn',@myupdatefcn);
% Wait while the user to click
disp('Click to indicate the point (press rotate if required), then press "Enter"')
disp('Keep ALT (or SHIFT) pressed to select more than one')
pause 
% Export cursor to workspace
info_struct = getCursorInfo(dcm_obj);
if isfield(info_struct, 'Position')
  if length(info_struct) == 1
    disp('Clicked position is')
    disp(info_struct.Position)
  else
    disp('Clicked position is')
    info_struct.Position
  end
end

%export cursor
cursor_info = info_struct;