function [surface_adj]= surface_coord_adj(surface_info)

% Adjust coordinates 
% surfaces from Brainstorm may not be oriented in coordinates 
% X: left-right
% Y: posterior-anterior
% Z: ventral_dorsal

% brainstorm default coordinates
% X = posterior-anterior
% Y = right-left
% Z = ventral-dorsal

% Input
% surface_info: struct with head mask matrix info from Brainstorm.

% Output
% surface_adj: ajusted coordinates surface

% P Sepulveda -- 2019

surface_adj = surface_info;
surface_adj.Vertices = [-surface_info.Vertices(:,2) surface_info.Vertices(:,1) surface_info.Vertices(:,3)] ;